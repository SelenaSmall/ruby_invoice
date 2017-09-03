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

    it 'should have a order_item attribute which is an instance of Item' do
      instance = OrderLine.new(3, Item.new('watermelon'))

      expect(instance.order_item).to be_a Item
    end

    it 'should have a order_packs attribute which is nil' do
      instance = OrderLine.new(3, Item.new('watermelon'))

      expect(instance.order_packs).to be_nil
    end
  end

  describe '#optimal' do
    it 'should return total_packs[0] which is an Array' do
      instance = OrderLine.new(12, Item.new('watermelon'))

      expect(instance.optimal(instance.order_item.name)).to be_a Array
    end

    it 'should return whole_packs[0] which is an Array' do
      instance = OrderLine.new(10, Item.new('watermelon'))

      expect(instance.optimal(instance.order_item.name)).to be_a Array
    end
  end

  describe '#present_line' do
    it 'should return whole_packs which is an Array' do
      instance = OrderLine.new(12, Item.new('watermelon'))

      expect(instance.present_line(instance.optimal(instance.order_item.name))).to be_a Array
    end
  end

  describe '#presenter_line_total' do
    it 'should return line_total which is an instance of Money' do
      instance = OrderLine.new(12, Item.new('watermelon'))
      instance.present_line(instance.optimal(instance.order_item.name))

      expect(instance.presenter_line_total).to be_a Money
    end
  end

  describe '#whole_packs' do
    it 'should return an Array' do
      instance = OrderLine.new(12, Item.new('watermelon'))
      pack_qtys = [[3, 6.99], [5, 8.99]]

      expect(instance.send(:whole_packs, pack_qtys, [], @order_qty)).to be_a Array
    end
  end

  describe '#left_over_items' do
    it 'should return an Array' do
      instance = OrderLine.new(12, Item.new('watermelon'))
      pack_qtys = [[3, 6.99], [5, 8.99]]

      expect(instance.send(:left_over_items, pack_qtys, [], 1)).to be_a Array
    end
  end
end
