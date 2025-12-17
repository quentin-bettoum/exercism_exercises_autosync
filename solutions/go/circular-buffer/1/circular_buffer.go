package circular

import "errors"

// Implement a circular buffer of bytes supporting both overflow-checked writes
// and unconditional, possibly overwriting, writes.
//
// We chose the provided API so that Buffer implements io.ByteReader
// and io.ByteWriter and can be used (size permitting) as a drop in
// replacement for anything using that interface.

type Buffer struct {
	items    []byte
	capacity int
}

var (
	ErrBufferIsFull  = errors.New("buffer is full")
	ErrBufferIsEmpty = errors.New("buffer is empty")
)

func NewBuffer(capacity int) *Buffer {
	return &Buffer{
		items:    make([]byte, 0, capacity),
		capacity: capacity,
	}
}

func (b *Buffer) ReadByte() (value byte, err error) {
	if b.isEmpty() {
		err = ErrBufferIsEmpty
	} else {
		value = b.items[0]
		b.items = b.items[1:]
	}

	return value, err
}

func (b *Buffer) WriteByte(c byte) (err error) {
	if b.isFull() {
		err = ErrBufferIsFull
	} else {
		b.items = append(b.items, c)
	}

	return err
}

func (b *Buffer) Overwrite(c byte) {
	if b.isFull() {
		b.items = append(b.items[1:], c)

		// NOTE: The two lines below does the same operation
		// in a more optimized manner, but it's less readable
		//
		// copy(b.items, b.items[1:])
		// b.items[len(b.items)-1] = c
	} else {
		b.WriteByte(c)
	}
}

func (b *Buffer) Reset() {
	b.items = b.items[:0]
}

func (b *Buffer) isEmpty() bool {
	return len(b.items) == 0
}

func (b *Buffer) isFull() bool {
	return len(b.items) == b.capacity
}
