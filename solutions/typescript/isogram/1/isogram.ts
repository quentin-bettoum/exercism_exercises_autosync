export function isIsogram(str: string): boolean {
  const chars = str
    .replace(/[\s-]+/, '')
    .toLowerCase()
    .split('')

  const unique_chars = new Set(chars)

  return chars.length === unique_chars.size
}
