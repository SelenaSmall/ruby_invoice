require_relative 'item'
require_relative 'order_line'

# HandleInput class
class HandleInput
  attr_reader :order

  # Actions
  ACTIONS = %w[LIST SHOP VIEW].freeze

  def initialize(order)
    @order = order
  end

  # Interpret method
  # @param command [String]
  # @return
  def interpret(command)
    return unless ACTIONS.detect { |a| a == command }

    if command == 'LIST'
      # list all availble items and package sizes
    end

    # return shop if command == 'SHOP'
    if command == 'SHOP'
      $stdout.print "Select qty and items, example: 3 watermelon \n"

      loop do
        input = $stdin.gets.chomp

        next if input.empty?

        unless 'BACK'.match?(input)
          shop(input)
          next
        end

        $stdout.print "Returning to main menu \n"
        break
      end
    end

    # show invoice total
    puts order.find_order_total if command == 'VIEW'
  end

  PATTERN = /^\s*\d+\s*(watermelon||pineapple||rockmelon)$/

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
