require "pry"
module MyEnumerable
  def my_select
    selections = []
    each do |value|
      selections <<  value if yield(value)
    end
    selections
  end

  def my_map
    selections = []
    each do |value|
      selections <<  yield(value)
    end
    selections
  end

  def my_reject
    rejections = []
    each do |value|
      rejections << value unless yield(value)
    end
    rejections
  end

  def my_detect
    each do |value|
      return value if yield(value)
    end
    nil
  end

  def my_any?
    each do |value|
      return true if yield(value)
    end
    false
  end

  def my_reduce(accumulator=nil)
    each do |value|
      if accumulator
        accumulator = yield(accumulator, value)
      else
        accumulator = yield(0, value)
      end
    end
    accumulator
  end
end

