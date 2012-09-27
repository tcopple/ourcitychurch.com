class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :community_group, :inverse_of => :address

  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
end
