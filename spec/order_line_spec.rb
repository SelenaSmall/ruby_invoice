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

  describe '#calculate_best' do
    it 'should return optimum combination of packs which is an Enumerator' do
      order_item = Item.new('rockmelons')
      instance = OrderLine.new(13, order_item)

      pack_qtys = []
      order_item.packs(instance.order_item.name).each { |p| pack_qtys << [p.qty, p.price] }

      same_packs = instance.send(:price_check, instance.send(:same_match, pack_qtys, []), [])
      diff_packs = instance.send(:price_check, instance.send(:diff_match, pack_qtys, [], []), [])

      expect(instance.calculate_best(same_packs, diff_packs)).to be_a Enumerator
    end

    it 'should return optimum combination of packs which is an Enumerator' do
      order_item = Item.new('watermelons')
      instance = OrderLine.new(10, order_item)

      pack_qtys = []
      order_item.packs(instance.order_item.name).each { |p| pack_qtys << [p.qty, p.price] }

      same_packs = instance.send(:price_check, instance.send(:same_match, pack_qtys, []), [])
      diff_packs = instance.send(:price_check, instance.send(:diff_match, pack_qtys, [], []), [])

      expect(instance.calculate_best(same_packs, diff_packs)).to be_a Enumerator
    end

    it 'should return optimum combination of packs which is an Enumerator' do
      order_item = Item.new('pineapples')
      instance = OrderLine.new(14, order_item)

      pack_qtys = []
      order_item.packs(instance.order_item.name).each { |p| pack_qtys << [p.qty, p.price] }

      same_packs = instance.send(:price_check, instance.send(:same_match, pack_qtys, []), [])
      diff_packs = instance.send(:price_check, instance.send(:diff_match, pack_qtys, [], []), [])

      expect(instance.calculate_best(same_packs, diff_packs)).to be_a Enumerator
    end

    it 'should return an Enumerator which is empty if the quantity cannot be made up of packs' do
      order_item = Item.new('pineapples')
      instance = OrderLine.new(1, order_item)

      pack_qtys = []
      order_item.packs(instance.order_item.name).each { |p| pack_qtys << [p.qty, p.price] }

      same_packs = instance.send(:price_check, instance.send(:same_match, pack_qtys, []), [])
      diff_packs = instance.send(:price_check, instance.send(:diff_match, pack_qtys, [], []), [])

      expect(instance.calculate_best(same_packs, diff_packs)).to be_a Enumerator
    end
  end

  describe '#present_line' do
    it 'should return subitems which is an Array' do
      instance = OrderLine.new(10, Item.new('watermelons'))

      expect(instance.present_line(instance.optimal(instance.order_item.name))).to be_a Array
    end

    it 'should return subitems which is an Array' do
      instance = OrderLine.new(14, Item.new('pineapples'))

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
