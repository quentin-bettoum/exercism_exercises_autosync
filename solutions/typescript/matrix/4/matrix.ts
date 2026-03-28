export class Matrix {
  readonly rows: number[][]
  readonly columns: number[][]

  constructor(str: string) {
    this.rows = str.split('\n').map(c => c.split(' ').map(Number))
    this.columns = this.rows[0].map((_, colIndex) =>
      this.rows.map(row => row[colIndex])
    )
  }
}
