class Banner
  include Mongoid::Document
  include Mongoid::Timestamps
  include WithAttachment

  field :link_to, type: String
end
