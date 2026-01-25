abstract struct CustomSetGeneric(T)
  @items : Hash(T, Bool) = {} of T => Bool

  def initialize(initial_items : Array(T) = [] of T)
    initial_items.each(&->add(T))
  end

  def empty? : Bool
    @items.empty?
  end

  def contains?(item : T) : Bool
    @items.has_key?(item)
  end

  def add(item : T) : self
    @items[item] = true
    self
  end

  def subset?(other : self) : Bool
    @items.keys.all?(->other.contains?(T))
  end

  def disjoint?(other : self) : Bool
    !@items.keys.any?(->other.contains?(T))
  end

  def equal?(other : self) : Bool
    @storage.size == other.@storage.size && subset?(other)
  end

  def intersection(other : self) : self
    self.class.new(@items.keys.select(->other.contains?(T)))
  end

  def difference(other : self) : self
    self.class.new(@items.keys.reject(->other.contains?(T)))
  end

  def union(other : self) : self
    self.class.new(@items.keys + other.@items.keys)
  end
end

struct CustomSet < CustomSetGeneric(Int32); end
