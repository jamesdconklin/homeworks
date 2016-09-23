class LRUCache
  def initialize(n)
    @cache_arr = Array.new()
    @max_size = n
  end

  def count
    @cache_arr.count
  end

  def show
    p @cache_arr
    # (0..count-1).each do |idx|
    #   p @cache_arr[idx]
    # end
  end

  def add(el)
    idx = @cache_arr.index(el)
    @cache_arr.delete_at(idx) if idx
    @cache_arr << el
    @cache_arr.shift until count <= @max_size
  end

  private

  attr_reader :cache_arr, :max_size

end
