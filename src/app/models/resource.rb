class Resource
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include WithAttachment
end
