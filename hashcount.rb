class FrequencyCounter

  def get_input
    input = []
    puts "Enter number of characters in array"
    size = gets.chomp.to_i
    puts "Enter elements one by one"
    size.times { input << gets.chomp }
    input
  end

  def get_frquency(countfrequency)
    hash = Hash.new(0)
      countfrequency.each do |element|
      hash[element] += 1
    end
    hash
  end

  def print_result(result)
    puts "Frequency of elements are : #{ result }"
  end
end
frequency_count = FrequencyCounter.new
user_input = frequency_count.get_input
result = frequency_count.get_frquency(user_input)
frequency_count.print_result(result)