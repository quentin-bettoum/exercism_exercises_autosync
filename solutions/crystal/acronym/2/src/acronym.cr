module Acronym
  def self.abbreviate(phrase : String) : String
    phrase.split(/[\s_-]+/).join(&.[0].upcase)
  end
end
