require 'chronic'

class String
  def to_time
    Chronic.parse(self)
  end
  
  def to_size
    amount,unit = self.split(" ")
    if amount and unit
      case unit.downcase
      when "bytes","b","by"
        amount.to_f
      when "mb","megabytes","mbs","m","mi","mo"
        amount.to_f * 1024
      when "gb","gigabytes","gbs","g","gi"
        amount.to_f * 1024 * 1024
      else
        nil
      end
    else
      nil
    end
  end
end