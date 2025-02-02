module Enumerable
  def my_each_with_index
    i = 0
    while i < self.length
      yield self[i], i if block_given?
      i += 1
    end
    self
  end

  def my_select
    new_array = []
    self.my_each do |value|
      if yield(value) == true
        new_array << value
      end
    end
    new_array
  end

  def my_all?
    result = true
    self.my_each do |value|
      if yield(value) == false
        result = false
      end
    end
    result
  end

  def my_any?
    result = false
    self.my_each do |value|
      if yield(value) == true
        result = true
      end
    end
    result
  end

  def my_none?
    result = true
    self.my_each do |value|
      if yield(value) == true
        result = false
      end
    end
    result
  end

  def my_count
    arr = []
    if block_given?
      self.my_each do |value|
        if yield(value) == true
          arr << value
        end
      end
      arr.size
    else
      self.size
    end
  end

  def my_map
    arr = []
    self.my_each do |value|
      arr << yield(value)
    end
    arr
  end

  def my_inject(acc)
    self.my_each do |value|
      acc = yield(acc, value)
    end
    acc
  end
end

# to include custom enumerables
class Array
  include Enumerable
  def my_each
    for element in self
      yield(element) if block_given?
    end
  end
end
