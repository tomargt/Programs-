def pyramid(height)
  height.times do |current_height|    
    print ' ' * (height - current_height)
    puts '*' * (2 * current_height + 1)
  end
end
pyramid 3
