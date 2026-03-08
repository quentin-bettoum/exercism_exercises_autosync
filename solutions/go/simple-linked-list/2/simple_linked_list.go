package simplelinkedlist

import (
	"errors"
)

var ErrEmptyList = errors.New("empty list")

type List[T int] struct {
	head *Element[T]
}

type Element[T int] struct {
	data T
	next *Element[T]
}

func New[T int](elements []T) *List[T] {
	list := &List[T]{}

	for _, v := range elements {
		list.Push(v)
	}

	return list
}

func (l *List[T]) Size() (count int) {
	for n := l.head; n != nil; n = n.next {
		count++
	}

	return count
}

func (l *List[T]) Push(element T) {
	l.head = &Element[T]{
		data: element,
		next: l.head,
	}
}

func (l *List[T]) Pop() (elem T, err error) {
	if l.Size() == 0 {
		err = ErrEmptyList
	} else {
		elem = l.head.data
		l.head = l.head.next
	}

	return elem, err
}

func (l *List[T]) Array() []T {
	size := l.Size()
	array := make([]T, size)
	el := l.head

	for i := range array {
		array[size-1-i] = el.data
		el = el.next
	}

	return array
}

func (l *List[T]) Reverse() *List[T] {
	reversed := New([]T{})

	for head := l.head; head != nil; head = head.next {
		reversed.Push(head.data)
	}

	return reversed
}
