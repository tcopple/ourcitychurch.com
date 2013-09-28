class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :menu_title, type: String
  validates :menu_title, presence: true, length: { allow_blank: false, minimum: 4 }

  field :page_title, type: String

  field :permalink, type: String
  validates :permalink, presence: true, uniqueness: { case_sensitive: false }, length: { allow_blank: false, minimum: 4 }

  field :link, type: String, :default => nil
  field :parent, type: String
  field :visible, type: Boolean
  field :order, type: Integer

  field :markup, type: Boolean, :default => true
  field :markup_content, type: String
  field :html_content, type: String

  field :editable, type: Boolean, :default => true

  key :permalink

  #god this has to be fixed, it's referenced as a fk in so many places but you can't write to it
  def title
    (page_title.nil? || page_title.empty? ? menu_title : page_title).titleize
  end

  def source
    (self.markup ? self.markup_content : self.html_content) || ""
  end

  def <=>(other)
    return 0 if !order && !other.order
    return 1 if !order
    return -1 if !other.order
    order <=> other.order
  end

  def source= content
    if self.markup
      self.markup_content = content
    else
      self.markup_content = nil
      self.html_content = content
    end
    save
  end

  def self.parent_menu_items
    Page.where(visible: true, :link.in => ["", nil]).any_of({parent: ""}, {parent: nil})
        .collect{|p| [p.menu_title, p.menu_title]}
        .unshift(["None", nil])
  end

  def editable?
    editable
  end

  def parent?
    !parent.nil? && !parent.empty?
  end

  def root?
    parent.nil? || parent.empty?
  end

  def siblings
    Page.all.select {|p| p.parent == self.parent}
  end

  def hiearchical_order
    parent_order = (self.parent.nil? || self.parent.empty?) ? "" : "#{Page.where(menu_title: self.parent).first.order}."
    return (self.order.nil? ? "" : parent_order << self.order.to_s)
  end
end
