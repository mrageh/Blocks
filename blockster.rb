@son = [1,2,3,4,5,6]

def my_select
  i = 0
  arr = []
  while i < @son.length
    result = yield @son[i]
    arr << @son[i] if result
    i += 1
  end
  arr
end

def my_my_select
  my_select do |i|
    yield i
  end
end

def my_my_my_select
  my_my_select do |i|
    yield i
  end
end

def my_my_my_my_select
  my_my_my_select do |i|
    yield i
  end
end

result = my_my_my_my_select do |i|
  i.even?
end

puts result
