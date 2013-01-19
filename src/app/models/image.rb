class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  include WithAttachment
end
