module Enumerable
  def my_each_with_index
    self.my_each do |element|
      yield element, index(element) if block_given?
    end
  end
  # Your code goes here
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
