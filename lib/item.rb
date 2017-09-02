require 'money'
require_relative 'pack'
I18n.enforce_available_locales = false

# Item class
class Item
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
