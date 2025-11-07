export function isPangram(input: string): boolean {
  const ascii_letters = new Set(
    input
      .toLowerCase()
      .split('')
      .filter(c => c.match(/[a-z]/))
  )

  return 26 === ascii_letters.size
}
