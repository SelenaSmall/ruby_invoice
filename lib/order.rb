# Order class
class Order
  attr_reader :items, :basket

  def initialize(basket)
    @items = []
    @basket = basket
  end
end
