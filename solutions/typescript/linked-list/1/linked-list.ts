type ListItem<T> = {
  value: T,
  next?: ListItem<T>
}

export class LinkedList<T> {
  #head?: ListItem<T>

  public push(element: T) {
    const newItem: ListItem<T> = { value: element }

    if (!this.#head) {
      this.#head = newItem
      return
    }

    let current = this.#head

    while (current.next) {
      current = current.next
    }

    current.next = newItem
  }

  public pop(): T {
    if (!this.#head) throw new Error('Empty list')

    if (!this.#head.next) {
      const value = this.#head.value
      this.#head = undefined
      return value
    }

    let current = this.#head

    while (current.next?.next) {
      current = current.next
    }

    const value = current.next!.value
    current.next = undefined

    return value
  }

  public shift(): T {
    if (!this.#head) throw new Error('Empty list')

    const value = this.#head.value
    this.#head = this.#head.next ?? undefined

    return value
  }

  public unshift(element: T) {
    this.#head = { value: element, next: this.#head ?? undefined }
  }

  public delete(element: T) {
    if (!this.#head) return

    if (this.#head.value === element) {
      this.#head = this.#head.next ?? undefined
      return
    }

    let current = this.#head

    while (current.next) {
      if (current.next.value === element) {
        current.next = current.next.next ?? undefined
        return
      }
      current = current.next
    }
  }

  public count(): number {
    let count = 0
    let current = this.#head

    while (current) {
      count++
      current = current.next
    }

    return count
  }
}
