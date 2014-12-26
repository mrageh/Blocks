require "stringio"

def capture_output
  begin
    old_output = $stdout
    $stdout = StringIO.new
    yield
    result = $stdout.string
  ensure
    $stdout = old_output
  end
  result
end

output = capture_output do
  puts "Hello!"
  puts "Pleased to meet you."
  puts "Goodbye..."
end

puts output
