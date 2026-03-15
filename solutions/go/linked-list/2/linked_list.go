package linkedlist

import "errors"

type List struct {
	head, tail *Node
	count      int
}

type Node struct {
	Value      any
	next, prev *Node
}

var errEmptyList = errors.New("list is empty")

func NewList(elements ...any) *List {
	list := &List{}

	for _, v := range elements {
		list.Push(v)
	}

	return list
}

func (n *Node) Next() *Node {
	return n.next
}

func (n *Node) Prev() *Node {
	return n.prev
}

// Unshift inserts value at the front of the list.
func (l *List) Unshift(v any) {
	newNode := &Node{Value: v, next: l.head}

	if l.head != nil {
		l.head.prev = newNode
	} else {
		l.tail = newNode
	}

	l.head = newNode
	l.count++
}

// Push inserts the value at the back of the list.
func (l *List) Push(v any) {
	newNode := &Node{Value: v}

	if l.isEmpty() {
		l.head, l.tail = newNode, newNode
	} else {
		newNode.prev = l.tail
		l.tail.next = newNode
		l.tail = newNode
	}

	l.count++
}

// Shift removes the value from the front of the list and return it.
func (l *List) Shift() (any, error) {
	if l.isEmpty() {
		return nil, errEmptyList
	}

	value := l.head.Value
	l.head = l.head.next
	l.count--

	if l.head == nil {
		l.tail = nil
	} else {
		l.head.prev = nil
	}

	return value, nil
}

// Pop removes the value from the back of the list and return it.
func (l *List) Pop() (any, error) {
	if l.isEmpty() {
		return nil, errEmptyList
	}

	value := l.tail.Value
	l.tail = l.tail.prev
	l.count--

	if l.tail == nil {
		l.head = nil
	} else {
		l.tail.next = nil
	}

	return value, nil
}

// Reverse reverses the list.
func (l *List) Reverse() {
	for current := l.head; current != nil; current = current.prev {
		current.prev, current.next = current.next, current.prev
	}

	l.head, l.tail = l.tail, l.head
}

// First returns the head of the list.
func (l *List) First() *Node {
	return l.head
}

// Last returns the tail of the list.
func (l *List) Last() *Node {
	return l.tail
}

// Count returns the length of the list.
func (l *List) Count() (count int) {
	return l.count
}

// Delete removes the first node in a list with a given value.
// Returns true if a node was removed.
func (l *List) Delete(v any) bool {
	for current := l.head; current != nil; current = current.next {
		if current.Value == v {
			l.count--

			if current == l.head {
				l.head = current.next
			}
			if current == l.tail {
				l.tail = current.prev
			}

			if current.prev != nil {
				current.prev.next = current.next
			}
			if current.next != nil {
				current.next.prev = current.prev
			}

			return true
		}
	}
	return false
}

func (l *List) isEmpty() bool {
	return l.count == 0
}
