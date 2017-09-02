# OrderLine class
class OrderLine
  attr_reader :order_qty, :order_item

  def initialize(order_qty, order_item)
    @order_qty = order_qty
    @order_item = order_item
  end
end
