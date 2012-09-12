class CommunityGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :meeting_day, type: String
  field :meeting_time, type: DateTime
  field :description, type: String

  embeds_one :address, cascade_callbacks: true
  has_many :leaders, class_name: 'CommunityGroupLeaders'
end
