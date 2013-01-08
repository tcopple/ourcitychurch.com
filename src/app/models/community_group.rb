class CommunityGroup
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  include Gmaps4rails::ActsAsGmappable
  acts_as_gmappable process_geocoding: false

  field :name, type: String
  field :meeting_day, type: String
  field :meeting_time, type: DateTime
  field :description, type: String

  embeds_one :address, cascade_callbacks: true
  accepts_nested_attributes_for :address,
                                # :reject_if => lambda { |a| a[:street].blank?
                                #                         or a[:city].blank?
                                #                         or a[:state].blank?
                                #                         or a[:zip].blank? },
                                :allow_estroy => true

  has_many :leaders, class_name: 'CommunityGroupLeader'
  accepts_nested_attributes_for :community_group_leader,
                                :allow_destroy => true

  def mappable?
    address.mappable?
  end

  def gmaps4rails_address
    address.coordinates
  end

  delegate :latitude, to: :address
  delegate :longitude, to: :address
end
