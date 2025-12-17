alias Capacity = UInt32
alias DefaultBufferType = UInt32

# Generic circular buffer implementation using Crystal's Deque as underlying storage.
#
# https://crystal-lang.org/api/Deque.html
#
# Deque ("double-ended queue") is implemented with a dynamic array used as a circular buffer,
# making it ideal for queue-like behavior where elements are added to the end and removed from the beginning.
# It performs better than an Array when there are frequent insertions or deletions of items
# near the beginning or the end.
#
# The generic parameter T specifies the type of elements stored in the buffer.
class CircularBufferGeneric(T)
  def initialize(@capacity : Capacity)
    @buffer = Deque(T).new(@capacity)
  end

  def read : T
    raise RuntimeError.new "Buffer is empty" if empty?
    @buffer.shift
  end

  def write(item : T)
    raise RuntimeError.new "Buffer is full" if full?
    @buffer.push(item)
  end

  def overwrite(item : T)
    @buffer.shift if full?
    write(item)
  end

  def clear
    @buffer.clear
  end

  private def empty? : Bool
    @buffer.empty?
  end

  private def full? : Bool
    @capacity == @buffer.size
  end
end

# This class inherits circular buffer with a default element type (UInt32) for the tests
class CircularBuffer < CircularBufferGeneric(DefaultBufferType); end
