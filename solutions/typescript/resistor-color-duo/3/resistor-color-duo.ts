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

export function decodedValue([a, b]: Color[]): number {
  return Number(`${Resistor[a]}${Resistor[b]}`)
}
