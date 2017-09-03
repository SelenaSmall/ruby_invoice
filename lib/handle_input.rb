require_relative 'item'
require_relative 'invoice'
require_relative 'order_line'

# HandleInput class
class HandleInput
  attr_reader :order, :invoice

  # Actions
  ACTIONS = %w[LIST SHOP VIEW].freeze

  def initialize(order)
    @order = order
    @invoice = Invoice.new
  end

  # Interpret method
  # @param command [String]
  # @return
  def interpret(command)
    return unless ACTIONS.detect { |a| a == command }

    if command.match?('LIST')
      # list all availble items and package sizes
    end

    return shop_menu if command.match?('SHOP')

    return invoice.print_order(order) if command.match?('VIEW')
  end

  private

  def shop_menu
    $stdout.print "Type BACK at any time to return to the main menu. \nAdd qty and items to backet, example input: 3 watermelons \n"

    loop do
      input = $stdin.gets.chomp

      next if input.empty?

      break if 'BACK'.match?(input)

      shop(input)
      next
    end
  end

  # Order input pattern
  PATTERN = /^\s*\d+\s*(watermelons||pineapples||rockmelons)$/

  # Order items
  def shop(input)
    unless input.match?(PATTERN)
      puts "That's not a valid input"
      return
    end

    # Break input down into qty, item
    line = input.split(/\W+/)

    exec(OrderLine.new(line[0].to_i, Item.new(line[1])))
  end

  # Add item order_line to order
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
