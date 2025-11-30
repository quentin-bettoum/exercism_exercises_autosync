export class Triangle {
  readonly isEquilateral: boolean = false
  readonly isIsosceles: boolean = false
  readonly isScalene: boolean = false

  constructor(...sides: number[]) {
    const [a, b, c] = sides.sort()
    const triangleInequality = a + b > c

    if (triangleInequality) {
      this.isEquilateral = a === b && b === c
      this.isIsosceles = a === b || b === c || c === a
      this.isScalene = !this.isIsosceles
    }
  }
}
