require 'money'
require_relative 'pack'
I18n.enforce_available_locales = false

# Item class
class Item
  # Products
  PRODUCTS = %w[watermelons pineapples rockmelons].freeze

  attr_reader :name, :pack

  def initialize(name)
    @name = name
    @pack = nil
  end

  # Packs method
  # @param product [String]
  # @return packs [Array]
  def packs(product)
    return unless PRODUCTS.detect { |a| a == product }

    send(product)
  end

  private

  # Watermelons method
  # return packs [Array]
  def watermelons
    [Pack.new(3, Money.new(699, 'NZD')),
     Pack.new(5, Money.new(899, 'NZD'))]
  end

  # Pineapples method
  # return packs [Array]
  def pineapples
    [Pack.new(2, Money.new(995, 'NZD')),
     Pack.new(5, Money.new(1695, 'NZD')),
     Pack.new(8, Money.new(2495, 'NZD'))]
  end

  # Rockmelons method
  # return packs [Array]
  def rockmelons
    [Pack.new(3, Money.new(595, 'NZD')),
     Pack.new(5, Money.new(995, 'NZD')),
     Pack.new(9, Money.new(1699, 'NZD'))]
  end
end
