export function sum(factors: number[], limit: number): number {
  let sum = 0

  for (let i = 1; i < limit; i++) {
    for (const f of factors) {
      if (f !== 0 && i % f === 0) {
        sum += i
        break
      }
    }
  }

  return sum
}

// export function sum(factors: number[], limit: number): number {
//   return Array.from({ length: limit - 1 }, (_, i) => i + 1)
//     .filter(num => factors.some(f => f !== 0 && num % f === 0))
//     .reduce((acc, num) => acc + num, 0)
// }
