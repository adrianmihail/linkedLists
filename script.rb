class Node

  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

class LinkedList

  def initialize
    @head = nil
  end

  def is_empty?
    if @head == nil
      return true
    else
      return false
    end
  end

  def append(value)
    if self.is_empty?
      @head = Node.new(value)
    else
      current_node = @head
      new_node = Node.new(value)
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end

  def prepend(value)
    if self.is_empty?
      @head = Node.new(value)
    else
      curr_head = Node.new(value)
      curr_head.next_node = @head
      @head = curr_head
    end
  end

  def size
    if self.is_empty?
      count = 0
    else
      count = 1
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
        count +=1
      end
    end
    count
  end

  def head
    @head
  end

  def tail
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node
  end

  def at(index)
    return if !@head
    return @head if index === 0

    node = @head
    counter = 0
    until node.next_node.nil?
      node = node.next_node
      counter += 1
      return node if counter === index
    end
  end

  def pop
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    last_node = current_node.next_node
    current_node.next_node = nil
  end

  def contains(value)
    current_node = @head
    return false if !current_node.next_node
    return current_node if current_node == value
    while (current_node = current_node.next_node)
      return current_node if current_node.value == value
    end
  end

  def find(value)
    current_node = @head
    counter = -1
    return false if !current_node.next_node
    return counter if current_node == value
    while (current_node = current_node.next_node)
      counter += 1
      return counter if current_node.value == value
    end
  end

  def to_s
    array = []
    current_node = @head
    if self.is_empty?
        return array
    else
        while current_node.next_node != nil
            array << current_node
            current_node = current_node.next_node
        end
        array << current_node
   end
   p array
end

end


testList = LinkedList.new
p testList.append(2)
p testList.append(3)
p testList.prepend(4)
p testList.size
p testList.head
p testList.tail
p testList.at(1)
p testList.pop
p testList.contains(2)
p testList.find(3)
testList.to_s