class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  validates :title, presence: true,
                    length: { allow_blank: false, minimum: 4 }

  field :permalink, type: String
  validates :permalink, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { allow_blank: false, minimum: 4 }

  field :link, type: String, :default => nil
  field :parent, type: String
  field :visible, type: Boolean
  field :order, type: Integer

  field :markup, type: Boolean, :default => true
  field :markup_content, type: String
  field :html_content, type: String

  key :permalink

  def source
    (self.markup ? self.markup_content : self.html_content) || ""
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
