export function nth(n: number): number {
  if (n === 0) throw new Error("Prime is not possible")

  let index = 0
  for (let num = 2; ; num++) {
    if (isPrime(num)) {
      index++
      if (index === n) {
        return num
      }
    }
  }
}

function isPrime(nbr: number): boolean {
  if (nbr === 2) {
    return true
  }
  if (nbr % 2 === 0) {
    return false
  }

  const limit = Math.sqrt(nbr)

  for (let x = 3; x <= limit; x += 2) {
    if (nbr % x === 0) {
      return false
    }
  }

  return true
}
