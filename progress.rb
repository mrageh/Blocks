def progress
  0.step(to: 100, by: 10) do |i|
    yield i
  end
end

progress { |percent| puts percent }
