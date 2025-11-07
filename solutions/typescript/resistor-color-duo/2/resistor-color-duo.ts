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

export function decodedValue(colors: Color[]): number {
  return Number(
    colors
      .slice(0, 2)
      .map(color => Resistor[color])
      .join('')
  )
}
