export class Anagram {
  word: string

  constructor(input: string) {
    this.word = input.toLowerCase()
  }

  public matches(...potentials: string[]): any[] {
    const { word, letterFrequencies, areMapsEqual } = this

    return potentials.filter(function(candidate: string): boolean {
      const c = candidate.toLowerCase()

      return c !== word && areMapsEqual(letterFrequencies(c), letterFrequencies(word))
    })
  }

  private letterFrequencies(word: string): Map<string, number> {
    return [...word].reduce(
      (acc, char) => {
        acc.set(char, (acc.get(char) || 0) + 1)
        return acc
      },
      new Map<string, number>
    )
  }

  private areMapsEqual<T, U>(map1: Map<T, U>, map2: Map<T, U>): boolean {
    if (map1.size !== map2.size) return false;

    for (const [key, value] of map1) {
        if (!map2.has(key)) return false;
        // For simple values, use ===; for objects, add deep comparison logic
        if (value !== map2.get(key)) return false;  // Shallow comparison
    }
    return true;
}
}
