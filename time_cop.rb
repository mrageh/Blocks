require 'timeout'
require 'open-uri'

def try_with_timeout(length_of_time)
  begin
    Timeout.timeout(length_of_time) do
      yield
    end
  rescue Exception
    puts "Took too long!"
  end
end

#try_with_timeout(2.0) do
#  sleep 1.0
#  puts "That was refreshing..."
#end
#try_with_timeout(2.0) do
#  sleep 3.0
#  puts "Yawn..."
#end


web_page = try_with_timeout(1.0) do
    open("http://example.com/")
end

puts web_page.read
