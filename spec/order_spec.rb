require 'rspec'
require 'spec_helper'
require './lib/order'

describe Order do
  describe '#initialize' do
    it 'should have a items attribute which is an empty Array' do
      instance = Order.new(Basket.new)

      expect(instance.items).to be_a Array
      expect(instance.items).to be_empty
    end

    it 'should have a basket attribute which is an instance of Basket' do
      instance = Order.new(Basket.new)

      expect(instance.basket).to be_a Basket
    end
  end
end
