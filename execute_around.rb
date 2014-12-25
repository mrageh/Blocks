def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  (23 - Time.now.hour) * Math::PI
end

def with_expectation(expected_value)
  puts "Running Test...."
  result = yield
  if result == expected_value
    puts "Passed"
  else
    puts "Failed"
    puts "Expected #{expected_value}, but got #{result}"
  end
end

with_expectation(4) { 2 + 2 }
with_expectation(5) { 2 + 2 }

def time_it(something)
  start_time = Time.now
  result = yield
  end_time = Time.now
  total_time = end_time - start_time
  puts "#{something} took #{total_time}"
end

require 'benchmark'

def time_it_benchmark(something)
  time_taken = Benchmark.realtime do
    yield
  end
  puts "#{something} took #{time_taken}"
end

time_it_benchmark("Sleepy code") do
  # run some code
sleep(1)
end

time_it("Sleepy code") do
  # run some code
sleep(1)
end
