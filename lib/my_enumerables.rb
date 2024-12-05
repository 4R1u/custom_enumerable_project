module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |item|
      yield(item, index)
      index += 1
    end
  end

  def my_select
    results = []
    self.my_each { |item| results << item if yield item }
    results
  end

  def my_all?
    self.my_each { |item| return false unless yield item }
    true
  end

  def my_any?
    self.my_each { |item| return true if yield item }
    false
  end

  def my_none?(&block)
    !self.my_any?(&block)
  end

  def my_count
    return size unless block_given?

    count = 0
    self.each { |item| count += 1 if yield item }
    count
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0...self.size
      yield self[i]
    end
    self
  end
end
