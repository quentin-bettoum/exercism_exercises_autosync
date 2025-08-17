# frozen_string_literal: true

# Handle series
class Clock
  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60
  end

  def to_s
    format('%<hour>02d:%<minute>02d', hour: @hour, minute: @minute)
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    other.hour == @hour && other.minute == @minute
  end
end
