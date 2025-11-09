export function isIsogram(str: string): boolean {
  return !str.match(/([a-z]).*\1/i)
}

// export function isIsogram(str: string): boolean {
//   const chars = str
//     .toLowerCase()
//     .replace(/[\s-]+/, '')
//     .split('')

//   const unique_chars = new Set(chars)

//   return chars.length === unique_chars.size
// }
