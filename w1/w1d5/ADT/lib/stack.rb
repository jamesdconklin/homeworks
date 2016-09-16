class Stack
  attr_reader :stack

  def initialize(enum=nil)
    @stack = enum ? enum.to_a : []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end

end
