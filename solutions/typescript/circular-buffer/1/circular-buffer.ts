export default class CircularBuffer<T> {
  #items: T[] = []
  #capacity: number = 0
  #isEmpty = () => this.#items.length === 0
  #isFull = () => this.#items.length === this.#capacity

  constructor(capacity: number) {
    this.#capacity = capacity
  }

  write(item: T): void {
    if (this.#isFull()) {
      throw new BufferFullError
    }

    this.#items.push(item)
  }

  read(): T {
    if (this.#isEmpty()) {
      throw new BufferEmptyError
    }

    return this.#items.shift() as T
  }

  forceWrite(item: T): void {
    if (this.#isFull()) {
      this.#items.shift()
    }

    this.write(item)
  }

  clear(): void {
    this.#items = []
  }
}

export class BufferFullError extends Error {
  constructor() {
    super('Buffer is full')
  }
}

export class BufferEmptyError extends Error {
  constructor() {
    super('Buffer is empty')
  }
}
