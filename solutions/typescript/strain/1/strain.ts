export function keep<T>(collection: Array<T>, predicate: (item: T) => boolean): Array<T> {
  return collection.filter(predicate)
}

export function discard<T>(collection: Array<T>, predicate: (item: T) => boolean): Array<T> {
  return collection.filter(i => !predicate(i))
}
