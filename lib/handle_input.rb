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
    return unless ACTIONS.include?(command)

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

    input = gets.chomp

    return if input.empty? #TODO: OR if it doesn't match a specific order pattern

    # break it down into qty, item
    line = input.split(/\W+/)

    # create the order_line
    order_line = OrderLine.new(line[0], line[1])

    # return the order line
    $stdout.print "#{order_line.order_qty} #{order_line.order_item} \n"
  end
end
