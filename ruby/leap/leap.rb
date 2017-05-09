module BookKeeping
  VERSION = 2
end

class Year
  def self.leap?(year)
    year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
  end
end
