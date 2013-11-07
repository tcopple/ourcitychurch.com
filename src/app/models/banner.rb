class Banner
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes
  include WithAttachment
  include Orderable

  field :link_to, type: String
  field :start_on, type: Time
  field :end_on, type: Time
  field :order, type: Integer

  def live?
    start = start_on || Time.now - 1
    finish  = end_on || Time.now + 1

    return (Time.now > start) && (Time.now < finish )
  end

  def self.next_iter
    list = Banner.all.collect{|b| b.order}
    list.empty? ? 1 : list.max + 1
  end
end
