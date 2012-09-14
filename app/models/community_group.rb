class CommunityGroup
  include Mongoid::Document
  include Mongoid::Timestamps

  field :meeting_day, type: String
  field :meeting_time, type: DateTime
  field :description, type: String

  embeds_one :address, cascade_callbacks: true
  accepts_nested_attributes_for :address,
                                :reject_if => lambda { |a| a[:street].blank?
                                                        || a[:city].blank?
                                                        || a[:state].blank?
                                                        || a[:zip].blank? },
                                :allow_estroy => true

  has_many :leaders, class_name: 'CommunityGroupLeader'
  accepts_nested_attributes_for :community_group_leader,
                                :reject_if => lambda { |a| a[:email].blank? },
                                :allow_estroy => true
end
