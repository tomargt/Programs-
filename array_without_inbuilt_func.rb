class JoinArray

  def get_input
    input = []
    puts "Enter number of characters in array"
    size = gets.chomp.to_i
    puts "Enter elements one by one"
    size.times { input << gets.chomp }
    input
  end

  def join_array(source , target)
    result = source
    target.each { |element| result << element }
    result
  end

  def print_result(result)
    puts "joined array is #{result}"
  end

end
joined_array = JoinArray.new  
source = joined_array.get_input
target = joined_array.get_input
result = joined_array.join_array(source , target)
joined_array.print_result(result)
