module Orderable
  extend ActiveSupport::Concern

  included do
    self.field :order, type: Integer
  end

  def <=>(other)
    return 0 if !order && !other.order
    return 1 if !order
    return -1 if !other.order
    order <=> other.order
  end
end
