export function find<T>(haystack: Array<T>, needle: T): number | never {
  let low = 0
  let high = haystack.length

  while (low < high) {
    const mid = Math.trunc((low + high) / 2)
    const value = haystack[mid]

    if (value === needle) return mid

    if (value < needle) {
      low = mid + 1
    } else {
      high = mid
    }
  }

  throw new Error('Value not in array')
}
