class Banner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include WithAttachment

  field :link_to, type: String
  field :start_on, type: Time
  field :end_on, type: Time

  def live?
    start = start_on || Time.now - 1
    finish  = end_on || Time.now + 1

    return (Time.now > start) && (Time.now < finish )
  end
end
