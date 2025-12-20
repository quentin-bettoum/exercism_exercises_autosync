const existingNames = new Set()

export class Robot {
  #name: string = ''

  private set name(value: string) {
    existingNames.add(value)
    this.#name = value
  }

  public get name(): string {
    while (this.#name === '') {
      const name = this.#randomName()
      if (!existingNames.has(name)) this.name = name
    }

    return this.#name
  }

  public resetName(): void {
    this.#name = ''
  }

  public static releaseNames(): void {
    existingNames.clear()
  }

  #randomName(): string {
    const randomLetters = Array.from({ length: 2 }, () =>
      String.fromCharCode(Math.floor(Math.random() * 26) + 65)
    ).join('')

    const randomDigits = Array.from({ length: 3 }, () =>
      Math.floor(Math.random() * 10)
    ).join('')

    return randomLetters + randomDigits
  }
}
