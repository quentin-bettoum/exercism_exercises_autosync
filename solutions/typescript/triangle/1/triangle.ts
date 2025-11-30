export class Triangle {
  private _equilateral = false
  private _isosceles = false
  private _scalene = false

  constructor(...sides: number[]) {
    const [a, b, c] = sides
    const allSidePositive = sides.every(side => side > 0)
    const triangleInequality = a + b > c && a + c > b && b + c > a
    // NOTE: another way of doing it
    // const triangleInequality = Math.max(a, b, c) * 2 < sides.reduce((acc, a) => acc + a, 0)

    if (allSidePositive && triangleInequality) {
      this._equilateral = a === b && b === c
      this._isosceles = a === b || b === c || c === a
      this._scalene = !this._isosceles
    }
  }

  get isEquilateral() {
    return this._equilateral
  }

  get isIsosceles() {
    return this._isosceles
  }

  get isScalene() {
    return this._scalene
  }
}
