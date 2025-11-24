type Frequency = Map<string, number>

export function count(phrase: string): Frequency {
  const freq: Frequency = new Map()

  for (const [word] of phrase.toLowerCase().matchAll(/\b[\w']+\b/g)) {
    const newValue = (freq.get(word) || 0) + 1
    freq.set(word, newValue)
  }

  return freq
}
