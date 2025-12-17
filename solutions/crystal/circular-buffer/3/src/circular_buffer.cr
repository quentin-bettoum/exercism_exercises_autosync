alias Capacity = Int32
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
class CircularBufferGeneric(T) < Deque(T)
  def initialize(@capacity : Capacity)
    super
  end

  def read : T
    raise RuntimeError.new "Buffer is empty" if self.empty?
    self.shift
  end

  def write(item : T)
    raise RuntimeError.new "Buffer is full" if full?
    self.push(item)
  end

  def overwrite(item : T)
    self.shift if full?
    write(item)
  end

  private def full? : Bool
    self.size == @capacity
  end
end

# This class inherits circular buffer with a default element type (UInt32) for the tests
class CircularBuffer < CircularBufferGeneric(DefaultBufferType); end
