// enum Planet {
//   Mercury = 'mercury',
//   Venus = 'venus',
//   Earth = 'earth',
//   Mars = 'mars',
//   Jupiter = 'jupiter',
//   Saturn = 'saturn',
//   Uranus = 'uranus',
//   Neptune = 'neptune'
// }

enum OrbitalPeriods {
  mercury = 0.2408467,
  venus = 0.61519726,
  earth = 1,
  mars = 1.8808158,
  jupiter = 11.862615,
  saturn = 29.447498,
  uranus = 84.016846,
  neptune = 164.79132,
}

const SECONDS_PER_YEAR: number = 60 * 60 * 24 * 365.25

export function age(planet: keyof typeof OrbitalPeriods, seconds: number): number {
  const age = seconds / SECONDS_PER_YEAR / OrbitalPeriods[planet]

  return Number(age.toFixed(2))
}

