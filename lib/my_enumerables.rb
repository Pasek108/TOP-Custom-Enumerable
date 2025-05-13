module Enumerable
  # Your code goes here

  def my_each_with_index
    for i in (0..self.length - 1) do yield(self[i], i) end
    self
  end

  def my_select
    result = []
    for i in (0..self.length - 1) do result << self[i] if yield(self[i]) end
    result
  end

  def my_all?
    for i in (0..self.length - 1) do return false unless yield(self[i]) end
    true
  end
  
  def my_any?
    for i in (0..self.length - 1) do return true if yield(self[i]) end
    false
  end
  

  def my_none?
    for i in (0..self.length - 1) do return false if yield(self[i]) end
    true
  end
  
  def my_count
    return self.length unless block_given? 

    count = 0
    for i in (0..self.length - 1) do count += 1 if yield(self[i]) end
    count
  end

  def my_map
    new_enum = []
    for i in (0..self.length - 1) do new_enum << yield(self[i]) end
    new_enum
  end
  
  def my_inject(start_value)
    result = start_value
    for i in (0..self.length - 1) do result = yield(result, self[i]) end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in (0..self.length - 1) do yield(self[i]) end
    self
  end
end
