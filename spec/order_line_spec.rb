require 'rspec'
require 'spec_helper'
require './lib/order_line'

describe OrderLine do
  describe '#initialize' do
    it 'should have a order_qty attribute which is an Integer' do
      instance = OrderLine.new(3, Item.new('watermelons'))

      expect(instance.order_qty).to be_a Integer
      expect(instance.order_qty).to eq 3
    end

    it 'should have a order_item attribute which is an instance of Item' do
      instance = OrderLine.new(3, Item.new('watermelons'))

      expect(instance.order_item).to be_a Item
    end

    it 'should have a order_packs attribute which is nil' do
      instance = OrderLine.new(3, Item.new('watermelons'))

      expect(instance.order_packs).to be_nil
    end
  end

  describe '#optimal' do
    it 'should return optimum combination of packs which is an Enumerator' do
      instance = OrderLine.new(12, Item.new('watermelons'))

      expect(instance.optimal(instance.order_item.name)).to be_a Enumerator
    end
  end

  describe '#present_line' do
    it 'should return whole_packs which is an Array' do
      instance = OrderLine.new(12, Item.new('watermelons'))

      expect(instance.present_line(instance.optimal(instance.order_item.name))).to be_a Array
    end
  end

  describe '#presenter_line_total' do
    it 'should return line_total which is an instance of Money' do
      instance = OrderLine.new(12, Item.new('watermelons'))
      instance.present_line(instance.optimal(instance.order_item.name))

      expect(instance.presenter_line_total).to be_a Money
    end
  end

  describe '#price_check' do
    it 'should return total prices for each match which is an Enumerator' do
      order_item = Item.new('watermelons')
      instance = OrderLine.new(10, order_item)

      pack_qtys = []
      order_item.packs(instance.order_item.name).each { |p| pack_qtys << [p.qty, p.price] }
      match = instance.send(:same_match, pack_qtys, [])

      expect(instance.send(:price_check, match, [])).to be_a Enumerator
    end
  end

  describe '#same_match' do
    it 'should return all same pack combinations which can make up the total, which is an Array' do
      order_item = Item.new('watermelons')
      instance = OrderLine.new(12, order_item)

      pack_qtys = []
      order_item.packs(instance.order_item.name).each { |p| pack_qtys << [p.qty, p.price] }

      expect(instance.send(:same_match, pack_qtys, [])).to be_a Array
    end
  end

  describe '#diff_match' do
    it 'should return all different pack combinations which can make up the total, which is an Array' do
      order_item = Item.new('watermelons')
      instance = OrderLine.new(12, order_item)

      pack_qtys = []
      order_item.packs(instance.order_item.name).each { |p| pack_qtys << [p.qty, p.price] }

      expect(instance.send(:diff_match, pack_qtys, [], [])).to be_a Array
    end
  end
end
