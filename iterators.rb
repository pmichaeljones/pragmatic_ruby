def n_times(number)
  1.upto(number) do |x|
    yield x
  end
end

n_times(5)# { puts "Hello!"}
