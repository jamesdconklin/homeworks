class Queue
  attr_reader :Queue

  def initialize(enum=nil)
    @queue = enum ? enum.to_a : []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end
