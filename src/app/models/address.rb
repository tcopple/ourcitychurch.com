class Address
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  after_validation :geocode
  embedded_in :community_group, :inverse_of => :address

  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :coordinates, type: Array

  geocoded_by :geocode_representation

  def geocode_representation
    "#{street}, #{city} #{state}, #{zip}"
  end

  def mappable?
    !coordinates.nil?
  end

  def latitude
    coordinates.last
  end

  def longitude
    coordinates.first
  end

  def line_one
    "#{street.titleize}"
  end

  def line_two
     "#{city.titleize}, #{state.upcase} #{zip}"
  end
end
