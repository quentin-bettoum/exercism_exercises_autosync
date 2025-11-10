export function parse(phrase: string): string {
  return Array.from(
      phrase.matchAll(/[A-Z]+[a-z']*|[a-z]+/g),
      match => match[0][0].toUpperCase())
    .join('')
}
