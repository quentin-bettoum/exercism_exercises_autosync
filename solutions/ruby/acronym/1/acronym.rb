# frozen_string_literal: true

# Create acronyms from strings
module Acronym
  def self.abbreviate(str)
    str
      .split(/[\s\-_]+/)
      .map { |w| w[0] }
      .join
      .upcase
  end
end
