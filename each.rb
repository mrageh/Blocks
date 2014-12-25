weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
class Array
  def my_each
    i = 0
    while i < self.size
      yield self[i]
      i += 1
    end
    self
  end

  def my_map
    i = 0
    result = []
    while i < self.size
      ele = yield self[i]
      result << ele
      i += 1
    end
    result
  end
end

weekdays.my_each do |day|
  puts day
end

upcased = weekdays.my_map do |day|
  day.upcase
end

puts upcased
