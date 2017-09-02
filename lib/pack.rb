# Pack class
class Pack
  attr_reader :qty, :price

  def initialize(qty, price)
    @qty = qty
    @price = price
  end
end
