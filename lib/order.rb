# Order class
class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(order_item)
    @items.push(order_item)
  end

  def find_order_total
    total = 0
    @items.each do |item|
      total += item.total_quantity_of_items
    end

    total
  end
end
