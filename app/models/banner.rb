class Banner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :link_to, type: String

  has_mongoid_attached_file :file,
                            :url => '/banners/:filename',
                            :path => ':rails_root/public/banners/:filename'

  def filename
    self.file.url.split('/').last.split('?')[0]
  end
end
