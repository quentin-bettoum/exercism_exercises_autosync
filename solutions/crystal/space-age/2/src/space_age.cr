class Space::Age
  alias Seconds = UInt64

  SECONDS_PER_YEAR = 60 * 60 * 24 * 365.25
  ORBITAL_PERIOD   = {
    "mercury" => 0.2408467,
    "venus"   => 0.61519726,
    "earth"   => 1.0,
    "mars"    => 1.8808158,
    "jupiter" => 11.862615,
    "saturn"  => 29.447498,
    "uranus"  => 84.016846,
    "neptune" => 164.79132,
  }

  def initialize(@seconds : Seconds); end

  def self.from_seconds(seconds : Seconds)
    new(seconds)
  end

  {% for planet, period in ORBITAL_PERIOD %}
    def age_on_{{planet.id}}
      @seconds / SECONDS_PER_YEAR / {{period}}
    end
  {% end %}
end
