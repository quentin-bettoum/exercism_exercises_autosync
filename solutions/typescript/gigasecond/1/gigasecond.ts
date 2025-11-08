export class Gigasecond {
  constructor(private readonly datetime: Date) {}

  public date(): Date {
    return new Date(this.datetime.getTime() + 1e12)
  }
}
