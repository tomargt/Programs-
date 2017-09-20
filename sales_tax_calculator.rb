class SalesTaxCalculator 

  EXEMPTED_ITEMS = ["chocolate", "chocolates", "pill", "pills", "book", "books"]
  
  def initialize
    @items = []
  end
  
  def get_input
    puts "Enter number of types of product"
    number_input  = gets.chomp.to_i
    item_list = []
    puts "Enter product quantity and detail as (1 book at 10.09) :"
    number_input.times do
      item_list.push(gets.chomp)
    end
    item_list
  end
  
  def get_order(item)
    order_list = item.split
    { quantity: order_list[0].to_i, price: order_list[-1].to_f, name: item.split("at ") [0],
      is_imported: (order_list.include? "imported"), is_applies_tax: applies_tax?(order_list) }
  end

  def calculate_sales_tax(item_tax)
    tax = 0
    tax = item_tax[:price] * 0.10 if item_tax[:is_applies_tax]
    tax += item_tax[:price] * 0.05 if item_tax[:is_imported]
    round_off(tax)
  end
  
  def applies_tax?(item)
    (EXEMPTED_ITEMS & item).empty?
  end

  def round_off(amount)
    (amount / 0.05) * 0.05
  end

  def get_innvoice(item_list)
    item_list.each do |item|
      order = get_order(item)
      order[:sales_tax] = calculate_sales_tax(order)
      @items.push(order)
    end
  end

  def get_items
    @items
  end
      
  def get_total_tax
    @items.inject(0) { |total_cost, current_item| total_cost + current_item[:sales_tax] * current_item[:quantity] }
  end

  def get_total_price
    @items.inject(0) { |total_cost, current_item| total_cost + (current_item[:price] + current_item[:sales_tax]) * current_item[:quantity]  }
  end
  
end

sales_tax_calculator = SalesTaxCalculator.new
item_list = sales_tax_calculator.get_input
sales_tax_calculator.get_innvoice(item_list)
items = sales_tax_calculator.get_items
total_sales_tax = sales_tax_calculator.get_total_tax
total_price = sales_tax_calculator.get_total_price
items.each do |item|
  puts "#{item[:name]}: #{'%.2f' % ((item[:price] + item[:sales_tax]) * item[:quantity])}"
end
puts "Applied Taxes: #{'%.2f' %total_sales_tax}"
puts "Total: #{'%.2f' %total_price}"
