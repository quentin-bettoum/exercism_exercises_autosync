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

  def self.abbreviate_bis(str)
    str
      .scan(/\b\w/)
      .join
      .upcase
  end
end
