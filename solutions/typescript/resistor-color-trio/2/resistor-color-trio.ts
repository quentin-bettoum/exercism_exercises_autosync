enum MetricPrefixes {
  ohms,
  kiloohms,
  megaohms,
  gigaohms,
}

enum Resistor {
  black,
  brown,
  red,
  orange,
  yellow,
  green,
  blue,
  violet,
  grey,
  white,
}

type Color = keyof typeof Resistor

export function decodedResistorValue([a, b, c]: Color[]): string {
  const rawNumber = (Resistor[a] * 10 + Resistor[b]) * 10 ** Resistor[c]
  const [number, unit] = convertWithMetrixPrefix(rawNumber)

  return `${number} ${unit}`
}

function convertWithMetrixPrefix(number: number): [number, string] {
  let unitLevel = 0

  while (number >= 1000) {
    number /= 1000
    unitLevel++
  }

  return [number, MetricPrefixes[unitLevel]]
}
