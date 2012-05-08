class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :file,
                            :url => '/images/:filename',
                            :path => ':rails_root/public/images/:filename'

  def filename
    self.file.url.split('/').last.split('?')[0]
  end
end
