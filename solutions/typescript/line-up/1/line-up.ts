export function format(name: string, number: number): string {
  return `${name}, you are the ${number}${ordinalIndicator(number)} customer we serve today. Thank you!`
}

function ordinalIndicator(number: number): string {
  const lastTwoDigits = number.toString().slice(-2)
  const lastDigit = lastTwoDigits.at(-1)

  if (lastDigit === '1' && lastTwoDigits !== '11') {
    return 'st'
  }

  if (lastDigit === '2' && lastTwoDigits !== '12') {
    return 'nd'
  }

  if (lastDigit === '3' && lastTwoDigits !== '13') {
    return 'rd'
  }

  return 'th'
}
