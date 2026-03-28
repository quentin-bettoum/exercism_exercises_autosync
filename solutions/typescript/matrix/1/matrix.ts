export class Matrix {
  rows: number[][]
  columns: number[][] = []

  constructor(str: string) {
    this.rows = str.split('\n').map(c => c.split(' ').map(n => Number(n)))
    this.columns = this.rows[0].map((_, colIndex) =>
      this.rows.map(row =>
        row[colIndex]
      )
    )
  }
}
