def original_meth(arg)
  yield arg #expects a block and passes it on argument
end

def caller_of_original_method
  # we call the method and give it a block
  original_meth("Block Parameter") do |a|
    yield a #expects a block and gives it one argument
  end
end

def caller_of_caller_of_original_method
  # we call the method and give it a block
  caller_of_original_method do |a|
    yield a #expects a black and gives it one argmuent
  end
end

def caller_of_caller_of_caller_of_original_method
  #call the method and give it a block
  caller_of_caller_of_original_method do |a|
    a #just return the value of the block parameter
  end
end

puts caller_of_caller_of_caller_of_original_method
