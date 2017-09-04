# Order class
class Order
  attr_reader :items

  def initialize
    @items = []
  end

  # Add item method
  # @param order_item [String]
  # @param breakdown [Array]
  # @return items [Array]
  def add_item(order_item, breakdown)
    @items.push([order_item, breakdown])
  end

  # Find order method
  # @param items [Array]
  # @return total [Money]
  def find_order_total
    total = 0
    @items.each do |item|
      total += item[0].presenter_line_total
    end

    total
  end
end
