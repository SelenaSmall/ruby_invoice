require_relative 'item'

# Watermelon class
class Watermelon < Item
  attr_reader :pack

  OPTIONS = [3, 5].freeze

  def initialize(name)
    super(name)
    @pack = nil
  end

  def pack_size(selection)
    return unless OPTIONS.include?(selection)

    return @pack = Pack.new(3, Money.new(699, 'NZD')) if selection == 3
    @pack = Pack.new(5, Money.new(899, 'NZD')) if selection == 5
  end
end

# watermelon = Watermelon.new('watermelon')
# puts watermelon

# size = watermelon.pack_size(3)

# puts size.qty
# puts size.price
