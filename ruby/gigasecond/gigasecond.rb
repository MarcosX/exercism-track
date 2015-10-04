class Gigasecond
  VERSION = 1
  SECONDS_TO_GIGASECOND = (10**9)
  def self.from(time)
    time + SECONDS_TO_GIGASECOND
  end
end
