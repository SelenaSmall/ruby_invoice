# List class
class List
  attr_reader :watermelons, :pineapples, :rockmelons

  def initialize
    @watermelons = Item.new('watermelons').packs('watermelons')
    @pineapples = Item.new('pineapples').packs('pineapples')
    @rockmelons = Item.new('rockmelons').packs('rockmelons')
  end

  # Selection method
  # @param watermelons [Array]
  # @param pineapples [Array]
  # @param rockmelons [Array]
  # @return nil
  def selection
    puts "\nWatermelons"
    watermelons.each { |i| puts "#{i.qty} pack @ #{i.price}" }

    puts "\nPineapples"
    pineapples.each { |i| puts "#{i.qty} pack @ #{i.price}" }

    puts "\nRockmelons"
    rockmelons.each { |i| puts "#{i.qty} pack @ #{i.price}" }

    puts "\n"
  end
end
