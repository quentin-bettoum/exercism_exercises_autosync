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

enum MetricPrefixes {
  ohms,
  kiloohms,
  megaohms,
  gigaohms,
}

export function decodedResistorValue([a, b, c]: Color[]): string {
  const rawValue = (Resistor[a] * 10 + Resistor[b]) * 10 ** Resistor[c]
  const [number, unit] = getNumberWithMetricPrefix(rawValue)

  return `${number} ${unit}`
}

function getNumberWithMetricPrefix(number: number): [number, string] {
  let unitLevel = 0

  while (number >= 1000) {
    number /= 1000
    unitLevel++
  }

  return [number, MetricPrefixes[unitLevel]]
}
