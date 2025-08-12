export class Anagram {
  readonly word: string

  constructor(input: string) {
    this.word = input.toLowerCase()
  }

  public matches(...potentials: string[]): any[] {
    const { word, sortLetters } = this

    const sortedWord = sortLetters(word)

    return potentials.filter(function(candidate: string): boolean {
      const c = candidate.toLowerCase()

      return c !== word && sortLetters(c) === sortedWord
    })
  }

  private sortLetters(word: string): string {
    return [...word.toLowerCase()].sort().join("");
  }
}
