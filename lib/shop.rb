# Shop class
class Shop
  attr_reader :order
  # Order input pattern
  PATTERN = /^\s*\d+\s*(watermelons||pineapples||rockmelons)$/

  def initialize(order)
    @order = order
  end

  def menu
    $stdout.print "Type BACK at any time to return to the main menu. \nAdd qty and items to backet, example input: 3 watermelons \n"

    loop do
      input = $stdin.gets.chomp

      next if input.empty?

      break if 'BACK'.match?(input)

      choose_items(input)
      next
    end
  end

  def choose_items(input)
    unless input.match?(PATTERN)
      puts "That's not a valid input"
      return
    end

    # Break input down into qty, item
    line = input.split(/\W+/)

    exec(OrderLine.new(line[0].to_i, Item.new(line[1])))
  end

  def exec(order_line)
    order.add_item(
      order_line,
      order_line.present_line(
        order_line.optimal(order_line.order_item.name)
      )
    )

    order_line
  end
end
