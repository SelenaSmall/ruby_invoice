require 'rspec'
require 'spec_helper'
require './lib/order'

describe Order do
  describe '#initialize' do
    it 'should have an items attribute which is an empty Array' do
      instance = Order.new

      expect(instance.items).to be_a Array
      expect(instance.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'should return an Array of items' do
      instance = Order.new
      order_line = OrderLine.new(10, Item.new('watermelon'))
      breakdown = order_line.present_line(order_line.optimal(order_line.order_item.name))

      expect(instance.add_item(order_line, breakdown)).to be_a Array
    end
  end

  describe '#find_order_total' do
    it 'should return 0 if there are no items in the items array' do
      instance = Order.new

      expect(instance.find_order_total).to eq 0
    end
  end
end
