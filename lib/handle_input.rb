require_relative 'item'
require_relative 'invoice'
require_relative 'list'
require_relative 'shop'
require_relative 'order_line'

# HandleInput class
class HandleInput
  attr_reader :order, :invoice, :list, :shop

  # Actions
  ACTIONS = %w[LIST SHOP VIEW].freeze

  def initialize(order)
    @order = order
    @invoice = Invoice.new
    @list = List.new
    @shop = Shop.new(order)
  end

  # Interpret method
  # @param command [String]
  # @return nil
  def interpret(command)
    return unless ACTIONS.detect { |a| a == command }

    return list.selection if command.match?('LIST')

    return shop.menu if command.match?('SHOP')

    invoice.print_order(order)
  end
end
