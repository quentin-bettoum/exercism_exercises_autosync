export class Squares {
  constructor(private readonly count: number) {}

  get sumOfSquares(): number {
    return this.range(1, this.count).reduce((acc, n) => acc + n ** 2, 0)
  }

  get squareOfSum(): number {
    return this.range(1, this.count).reduce((acc, n) => acc + n) ** 2
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares
  }

  private *range(start: number, end: number) {
    for (let i = start; i <= end; i++) yield i
  }
}
