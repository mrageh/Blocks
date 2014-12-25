def three_times
  1.upto(3) do |i|
    yield i
  end
end

def n_times(num)
  1.upto(num) do |i|
    yield i
  end
end

#three_times do |number|
#  puts "#{number} situp!"
#  puts "#{number} pushup!"
#  puts "#{number} chinup!"
#end

n_times(5) do |number|
  puts "#{number} situp!"
  puts "#{number} pushup!"
  puts "#{number} chinup!"
end
