class Resource
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  has_mongoid_attached_file :file,
                            :url => '/resources/:filename',
                            :path => ':rails_root/public/resources/:filename'

  def filename
    self.file.url.split('/').last.split('?')[0]
  end
end
