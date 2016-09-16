class Map
  attr_reader :arr_map

  def initialize(enum=nil)
    @arr_map = enum ? enum.to_a : []
  end

  def assign(k,v)
    @arr_map.each do |pair|
      if pair[0] == k
        pair[1] = v
        return
      end
    end
    @arr_map << [k,v]
  end

  def lookup(key)
    @arr.map.each do |k,v|
      return v if k == key
    end
    nil
  end

  def remove(key)
    @arr_map.delete_if {|k,v| key == k}
  end

  def show
    @arr_map.dup
  end

end
