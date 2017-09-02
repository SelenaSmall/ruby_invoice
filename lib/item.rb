require 'money'
require_relative 'pack'
I18n.enforce_available_locales = false

# Item class
class Item
  attr_reader :name, :pack

  def initialize(name)
    @name = name
    @pack = nil
  end

  def watermelon
    threepack = Pack.new(3, Money.new(699, 'NZD'))
    fivepack = Pack.new(5, Money.new(899, 'NZD'))

    [threepack, fivepack]
  end
end
