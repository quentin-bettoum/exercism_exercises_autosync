export class Gigasecond {
  startTime: number

  constructor(startDate: Date) {
    this.startTime = startDate.getTime()
  }

  public date(): Date {
    return new Date(this.startTime + 1e12)
  }
}
