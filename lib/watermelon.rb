require_relative 'item'

# Watermelon class
class Watermelon < Item
  attr_reader :pack

  OPTIONS = [3, 5].freeze

  def initialize
    @pack = nil
  end

  # Pack size method
  # @Param qty [Int]
  # @Return @pack
  def pack_sizes(qty)
    return unless OPTIONS.include?(qty)

    return @pack = Pack.new(3, Money.new(699, 'NZD')) if qty == 3
    @pack = Pack.new(5, Money.new(899, 'NZD')) if qty == 5
  end
end
