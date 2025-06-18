# frozen_string_literal: true

# Determine the date and time one gigasecond after a certain date
module Gigasecond
  def self.from(datetime)
    datetime + 1e9
  end
end
