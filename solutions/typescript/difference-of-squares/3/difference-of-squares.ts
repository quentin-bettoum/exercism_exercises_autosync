export class Squares {
  constructor(private readonly count: number) { }

  get sumOfSquares(): number {
    return this
      .range(1, this.count)
      .reduce((acc, n) => acc + n ** 2, 0)
  }

  get squareOfSum(): number {
    return this
      .range(1, this.count)
      .reduce((acc, n) => acc + n) ** 2
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares
  }

  private range(start: number, end: number) {
    return Array.from({ length: end - start + 1 }, (_, i) => i + start)
  }
}
