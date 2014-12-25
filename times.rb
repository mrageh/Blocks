class Numeric
  def my_times
    i = 0
    while i < self
      yield i
      i += 1
    end
  end
end

15.my_times do |i|
  puts "My own times method #{i}"
end
