require 'rspec'
require 'spec_helper'
require './lib/order_line'

describe OrderLine do
  describe '#initialize' do
    it 'should have a order_qty attribute which is an Integer' do
      instance = OrderLine.new(3, 'watermelon')

      expect(instance.order_qty).to be_a Integer
      expect(instance.order_qty).to eq 3
    end

    it 'should have a order_item attribute which is an instance of Item' do
      instance = OrderLine.new(3, Watermelon.new('watermelon'))

      expect(instance.order_item).to be_a Item
    end
  end
end
