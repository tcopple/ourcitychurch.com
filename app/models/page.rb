class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  validates_presence_of :title
  validates_length_of :title, allow_blank: false, minimum: 4

  field :permalink, type: String
  validates_presence_of :permalink
  validates_uniqueness_of :permalink, case_sensitive: false
  validates_length_of :permalink, allow_blank: false, minimum: 4

  field :description, type: String

  field :parent, type: String
  field :visible, type: Boolean
  field :order, type: Integer

  field :link, type: String, :default => nil

  field :markup, type: Boolean, :default => true
  field :markup_content, type: String
  field :html_content, type: String

  key :permalink

  def source
    ret = if self.markup
            self.markup_content
          else
            self.html_content
          end

    ret || ""
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
    Page.where(:parent => nil, :visible => true, :link => nil)
        .collect{|p| [p.title, p.title]}
        .unshift(["None", nil])
  end

end
