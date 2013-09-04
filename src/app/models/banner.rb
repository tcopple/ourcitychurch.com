class Banner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include WithAttachment

  field :link_to, type: String
  field :start_on, type: Time
  field :end_on, type: Time

  def live?
    pp self.file.url
    pp "#{self.start_on} #{self.end_on}"
    pp DateTime.now

    start = start_on || Time.now - 1
    finish  = end_on || Time.now + 1
    pp (Time.now > start)
    pp (Time.now < finish )
    return (Time.now > start) && (Time.now < finish )
  end
end
