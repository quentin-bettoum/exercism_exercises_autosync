module Gigasecond
  def self.from(start : Time) : Time
    start + 1e9.seconds
  end
end
