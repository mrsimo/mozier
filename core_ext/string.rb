require 'chronic'

class String
  def to_time
    Chronic.parse(self)
  end
end