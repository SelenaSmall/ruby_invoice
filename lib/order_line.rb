require_relative 'item'

# OrderLine class
class OrderLine
  attr_reader :order_qty, :order_item, :order_packs

  def initialize(order_qty, order_item)
    @order_qty = order_qty
    @order_item = order_item
    @order_packs = nil
  end

  def optimal(product)
    puts "Quantity: #{order_qty}"
    pack_qtys = []
    @order_item.packs(product).each { |p| pack_qtys << [p.qty, p.price] }
    puts "Packs: #{pack_qtys}"

    # Get Exact matches
    exact_matches = []
    pack_qtys.sort { |a, b| b <=> a }.each do |p, v|
      next unless (order_qty / p) * p == order_qty
      exact_matches << [order_qty / p, p, v]
    end
    # puts exact_matches

    # Check for the optimim price
    price_check = []
    exact_matches.each do |x, y, z|
      val = (x * z)

      price_check << [x, y, z, val]
    end
    # puts price_check

    numbers = price_check.select { |x| x[3] }.map

    # Get Part matches
    partial_matches = []
    pack_qtys.sort { |a, b| b <=> a }.each do |p, v|
      partial_matches << [order_qty / p, p, v]
    end
    puts "partial: #{partial_matches}"

    # Top up part matches
    exact_partial = []
    partial_matches.each do |x, y, z|
      val = order_qty - (x * y)
      puts "VAL: #{val}"
      pack_qtys.detect do |a|
        # To be optimised: a.include?(val) does not cooperate with Money
        if a[0] == val || a[0] * 3 == val
          exact_partial << [x, y, z]
          exact_partial << [val / a[0], a[0], a[1]]
        end
      end
    end
    puts "exact partial: #{exact_partial}"

    # Check for the optimim partial price
    partial_price_check = []
    exact_partial.each do |x, y, z|
      val = (x * z)

      partial_price_check << [x, y, z, val]
    end
    # puts partial_price_check

    partial_numbers = partial_price_check.select { |x| x[3] }.map

    partial_price_array = []
    partial_numbers.each do |f|
      partial_price_array << f
    end
    # puts partial_price_array

    puts "Exact Match: #{exact_matches}"
    # Array for best price line: 1x 9pk @16 = $16
    puts "Best Exact Price: #{numbers.min}"
    puts "Partial Match: #{exact_partial}"
    puts "Best Partial Price: #{partial_price_array}"

    return calculate_best(numbers, partial_price_array) unless price_check.empty?

    calculate_best(numbers.min, partial_price_array)
  end

  def calculate_best(exact, partial)
    if exact.nil?
      puts "\nThis is it #{partial}"
      return partial
    end

    if partial.empty?
      puts "\nThis is it #{exact}"
      return exact
    end

    sub_total = []
    partial.each do |_x, _y, _z, val|
      sub_total << val
    end

    # Find total cost of sub_items
    line_total = sub_total.inject(:+)

    # Return array of the cheapest line
    if [exact.min[3], line_total].min == line_total
      puts "\nThis is it #{partial}"
      return partial
    end

    puts "\nThis is it #{exact}" if [exact.min[3], line_total].min == exact
    exact
  end

  def present_line(packs)
    puts "pACKS: #{packs}"
    sub_total = []
    sub_item = []
    packs.each do |k, v, i|
      sub_total << k * i
      sub_item << "#{k}x #{v} packs @ #{i}"
    end

    @line_total = sub_total.inject(:+)

    sub_item.each { |s| s }
  end

  def presenter_line_total
    @line_total
  end
end
