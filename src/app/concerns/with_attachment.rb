module WithAttachment
  include Mongoid::Paperclip
  extend ActiveSupport::Concern

  included do
    plural_klass = self.to_s.pluralize.underscore
    self.has_mongoid_attached_file( :file,
                                    url: "/#{plural_klass}/:filename",
                                    path: ":rails_root/public/#{plural_klass}/:filename")
  end

  def filename
    self.file.url.split('/').last.split('?')[0]
  end
end
