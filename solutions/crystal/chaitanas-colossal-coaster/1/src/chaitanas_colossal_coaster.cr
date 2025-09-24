module ColossalCoaster
  extend self

  alias Person = String
  alias Queue = Array(Person)

  def add_to_queue(express_queue : Queue, normal_queue : Queue, express : Int8, person_name : Person) : Queue
    (express == 1 ? express_queue : normal_queue).push(person_name)
  end

  def find_my_friend(queue : Queue, friend_name : Person) : Int32
    queue.index!(friend_name)
  end

  def add_with_friends(queue : Queue, friend_name : Person, person_name : Person) : Queue
    friend_pos = find_my_friend(queue, friend_name)
    queue.insert(friend_pos, person_name)
  end

  def remove_from_queue(queue : Queue, person_name : Person) : Queue
    # queue.delete(person_name) && queue
    # queue.reject(&.== person_name)
    queue - [person_name]
  end

  def sorted_queue(queue : Queue) : Queue
    queue.sort
  end
end
