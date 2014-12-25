def h1
  content = yield
  "<h1>#{content}</h1>"
end
puts h1 { "Breaking News!" }

def h2
  content = yield
  "<h2>#{content}</h2>"
end

puts h2 { "Massive Ruby Discovered" }

def tag(name)
  content = yield
  "<#{name}>#{content}</#{name}>"
end

puts tag(:h1) { "Breaking News!" }
puts tag(:h2) { "Massive Ruby Discovered" }

ul = tag(:ul) do
  first = tag(:li) { "It sparkles!"}
  second = tag(:li) { "It shines!"}
  third = tag(:li) { "It mesmerizes!"}
  first + second + third
end

puts ul
