package simplelinkedlist

import "errors"

var ErrEmptyList = errors.New("list is empty")

type ListGeneric[T int] struct {
	head *ElementGeneric[T]
}

type ElementGeneric[T int] struct {
	data T
	next *ElementGeneric[T]
}

type List = ListGeneric[int]

func New[T int](elements []T) *ListGeneric[T] {
	list := &ListGeneric[T]{}

	for _, v := range elements {
		list.Push(v)
	}

	return list
}

func (l *ListGeneric[T]) Size() (count int) {
	for n := l.head; n != nil; n = n.next {
		count++
	}

	return count
}

func (l *ListGeneric[T]) Push(element T) {
	l.head = &ElementGeneric[T]{
		data: element,
		next: l.head,
	}
}

func (l *ListGeneric[T]) Pop() (elem T, err error) {
	if l.Size() == 0 {
		err = ErrEmptyList
	} else {
		elem = l.head.data
		l.head = l.head.next
	}

	return elem, err
}

func (l *ListGeneric[T]) Peek() (elem T, err error) {
	if l.Size() == 0 {
		err = ErrEmptyList
	} else {
		elem = l.head.data
	}

	return
}

func (l *ListGeneric[T]) Array() []T {
	size := l.Size()
	array := make([]T, size)
	el := l.head

	for i := range array {
		array[size-1-i] = el.data
		el = el.next
	}

	return array
}

func (l *ListGeneric[T]) Reverse() *ListGeneric[T] {
	reversed := New([]T{})

	for head := l.head; head != nil; head = head.next {
		reversed.Push(head.data)
	}

	return reversed
}
