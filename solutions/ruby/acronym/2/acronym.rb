# frozen_string_literal: true

# Create acronyms from strings
module Acronym
  def self.abbreviate(str)
    str
      .split(/[\s\-_]+/)
      .map(&:chr)
      .join
      .upcase
  end
end
