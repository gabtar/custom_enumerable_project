# frozen_string_literal: true

##
# Custom enumerable methods
module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    my_selection = []
    my_each do |element|
      my_selection << element if yield(element)
    end
    my_selection
  end

  def my_all?
    satisfies_condion = true
    my_each do |element|
      satisfies_condion = false unless yield(element)
      break unless satisfies_condion
    end
    satisfies_condion
  end

  def my_any?
    satisfies_condion = false
    my_each do |element|
      satisfies_condion = true if yield(element)
      break if satisfies_condion
    end
    satisfies_condion
  end

  def my_none?(&block)
    !my_any?(&block)
  end

  def my_count(&block)
    return length unless block_given?

    my_select(&block).length
  end

  def my_map
    my_mapped = []
    my_each do |element|
      my_mapped << yield(element)
    end
    my_mapped
  end

  def my_inject(initial_value = 0)
    my_each do |element|
      initial_value = yield(initial_value, element)
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    length = self.length
    index = 0

    while index < length
      yield(self[index])
      index += 1
    end
    self
  end
end
