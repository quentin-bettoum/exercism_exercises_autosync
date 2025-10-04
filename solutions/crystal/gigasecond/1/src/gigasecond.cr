module Gigasecond
  def self.from(start : Time) : Time
    start + Time::Span.new(seconds: 1e9.to_i)
  end
end
