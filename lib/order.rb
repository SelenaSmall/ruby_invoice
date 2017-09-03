# Order class
class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(order_item, breakdown)
    @items.push([order_item, breakdown])
  end

  def find_order_total
    total = 0
    @items.each do |item|
      total += item[0].presenter_line_total
    end

    total
  end
end
