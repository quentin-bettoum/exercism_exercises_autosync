export function convert(number: number): string {
  let str: string = ''

  if (number % 3 === 0) str += 'Pling'
  if (number % 5 === 0) str += 'Plang'
  if (number % 7 === 0) str += 'Plong'

  return str || number.toString()
}
