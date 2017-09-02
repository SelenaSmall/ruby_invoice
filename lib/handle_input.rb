require_relative 'item'
require_relative 'order_line'

# HandleInput class
class HandleInput
  # Actions
  ACTIONS = %w[LIST SHOP VIEW EXIT].freeze

  # Interpret method
  # @param command [String]
  # @return
  def interpret(command)
    return unless ACTIONS.detect { |a| a == command }

    $stdout.print "#{command} \n"

    if command == 'LIST'
      # list all availble items and package sizes
    end

    return shop if command == 'SHOP'

    if command == 'VIEW'
      # show invoice
    end

    if command == 'EXIT'
      # exit
    end
  end

  def shop
    # retrieve another input
    $stdout.print "Select qty and items, example: 3 watermelon \n"

    input = $stdin.gets.chomp

    return if input.empty? # TODO: OR if it doesn't match a specific order pattern

    # break it down into qty, item
    line = input.split(/\W+/)

    # TODO: Ensure the order_item is valid

    # Create a order_line containing the new item
    order_line = OrderLine.new(line[0].to_i, Item.new(line[1]))

    # Find optimal qty of packs
    product = order_line.optimal(order_line.order_item.name)

    # Present order_line for invoice
    order_line.present_line(product)

    order_line
  end
end
