require 'rspec'
require 'spec_helper'
require './lib/order_line'

describe OrderLine do
  describe '#initialize' do
    it 'should have a order_qty attribute which is an Integer' do
      instance = OrderLine.new(3, Item.new('watermelon'))

      expect(instance.order_qty).to be_a Integer
      expect(instance.order_qty).to eq 3
    end
  end

  describe '#optimal' do
    it 'should return whole_packs which is an Array' do
      instance = OrderLine.new(12, Item.new('watermelon'))

      expect(instance.optimal(instance.order_item.name)).to be_a Array
    end
  end

  describe '#present_line' do
    it 'should return whole_packs which is an Array' do
      instance = OrderLine.new(12, Item.new('watermelon'))

      expect(instance.present_line(instance.optimal(instance.order_item.name))).to be_a Array
    end
  end
end
