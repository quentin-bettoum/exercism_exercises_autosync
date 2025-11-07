enum Encodings {
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

type Color = keyof typeof Encodings

export function decodedValue(colors: Color[]): number {
  return Number(
    colors
      .slice(0, 2)
      .map(color => Encodings[color])
      .join('')
  )
}
