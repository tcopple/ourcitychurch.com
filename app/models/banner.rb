class Banner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include WithAttachment

  field :link_to, type: String
end
