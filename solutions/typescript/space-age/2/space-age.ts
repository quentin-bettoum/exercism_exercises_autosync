type Planet =
  'mercury' |
  'venus' |
  'earth' |
  'mars' |
  'jupiter' |
  'saturn' |
  'uranus' |
  'neptune'

const seconds_per_year: number = 60 * 60 * 24 * 365.25
const orbital_periods: Record<Planet, number> = {
  'mercury': 0.2408467,
  'venus': 0.61519726,
  'earth': 1.0,
  'mars': 1.8808158,
  'jupiter': 11.862615,
  'saturn': 29.447498,
  'uranus': 84.016846,
  'neptune': 164.79132
}

export function age(planet: Planet, seconds: number): number {
  return Number((seconds / seconds_per_year / orbital_periods[planet]).toFixed(2))
}
