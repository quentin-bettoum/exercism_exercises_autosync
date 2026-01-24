type Item = string | number | symbol
type MapSet = Record<Item, true>

export class CustomSet {
  #mapset: MapSet = {}

  constructor(initialItems: Array<Item> = []) {
    for (const item of initialItems) {
      if (!this.contains(item)) {
        this.add(item)
      }
    }
  }

  empty(): boolean {
    return Object.keys(this.#mapset).length === 0
  }

  contains(element: Item): boolean {
    return Boolean(this.#mapset[element])
  }

  add(element: Item): CustomSet {
    this.#mapset[element] = true
    return this
  }

  subset(other: CustomSet): boolean {
    return this.#items().every(i => other.contains(i))
  }

  disjoint(other: CustomSet): boolean {
    return !this.#items().some(i => other.contains(i))
  }

  eql(other: CustomSet): boolean {
    return this.subset(other) && other.subset(this)
  }

  union(other: CustomSet): CustomSet {
    for (const item of this.#items()) {
      other.add(item)
    }

    return other
  }

  intersection(other: CustomSet): CustomSet {
    return new CustomSet(this.#items().filter(i => other.contains(i)))
  }

  difference(other: CustomSet): CustomSet {
    return new CustomSet(this.#items().filter(i => !other.contains(i)))
  }

  #items(): Item[] {
    return Object.keys(this.#mapset)
  }
}
