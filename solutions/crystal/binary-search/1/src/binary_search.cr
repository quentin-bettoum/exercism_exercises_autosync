class BinarySearchGeneric(T)
  def initialize(@items : Array(T)); end

  def find(value : T)
    raise ArgumentError.new "the array is empty" if @items.empty?

    low = 0
    high = @items.size

    while low < high
      mid = (low + high) // 2
      case @items[mid]
      when .==(value)
        return mid
      when .<(value)
        low = mid + 1
      when .>(value)
        high = mid
      end
    end

    raise ArgumentError.new "value not found in array"
  end
end

class BinarySearch < BinarySearchGeneric(Int32); end
