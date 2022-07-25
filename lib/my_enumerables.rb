module Enumerable
  def my_each_with_index
    i = 0
    while i < self.length
      yield self[i], i if block_given?
      i += 1
    end
    return self
  end

  def my_select
    new_array = []
    self.my_each do |value|
      if yield(value) == true
        new_array << value
      end
    end
    return new_array
  end

  def my_all?
    result = true
    self.my_each do |value|
      if yield(value) == false
        result = false
      end
    end
    return result
  end

  def my_any?
    result = false
    self.my_each do |value|
      if yield(value) == true
        result = true
      end
    end
    return result
  end

  def my_none?
    result = true
    self.my_each do |value|
      if yield(value) == true
        result = false
      end
    end
    return result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
include Enumerable
  def my_each
    for element in self
      yield(element) if block_given?
    end
  end
end
