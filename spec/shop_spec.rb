require 'rspec'
require 'spec_helper'
require './lib/shop'

describe Shop do
  describe '#initialize' do
    it 'should have an order attribute which is an instance of Order' do
      instance = Shop.new(Order.new)

      expect(instance.order).to be_a Order
      expect(instance.order.items).to be_a Array
      expect(instance.order.items).to be_empty
    end
  end

  describe '#menu' do
    before do
      $stdin = StringIO.new('3 watermelons')
      $stdin = StringIO.new('BACK')
    end

    it 'should return nil' do
      instance = Shop.new(Order.new)

      expect(instance.send(:menu)).to be_nil
    end
  end

  describe '#choose_items' do
    it 'should return an instance of OrderLine' do
      instance = Shop.new(Order.new)

      expect(instance.send(:choose_items, '10 watermelons')).to be_a OrderLine
      expect(instance.send(:choose_items, '10 watermelons').order_qty).to eq 10
      expect(instance.send(:choose_items, '10 watermelons').order_item).to be_a Item
      expect(instance.send(:choose_items, '10 watermelons').order_item.name).to eq 'watermelons'
      expect(instance.send(:choose_items, '10 watermelons').order_item.pack).to be_nil
      expect(instance.send(:choose_items, '10 watermelons').order_packs).to be_nil
    end

    it 'should return nil if input does not match PATTERN' do
      instance = Shop.new(Order.new)

      expect(instance.send(:choose_items, 'fruit')).to be_nil
    end
  end

  describe '#exec' do
    it 'should return an instance of OrderLine' do
      instance = Shop.new(Order.new)

      expect(instance.send(:exec, OrderLine.new(10, Item.new('watermelons')))).to be_a OrderLine
      expect(instance.send(:exec, OrderLine.new(10, Item.new('watermelons'))).order_qty).to eq 10
      expect(instance.send(:exec, OrderLine.new(10, Item.new('watermelons'))).order_item).to be_a Item
      expect(instance.send(:exec, OrderLine.new(10, Item.new('watermelons'))).order_item.name).to eq 'watermelons'
      expect(instance.send(:exec, OrderLine.new(10, Item.new('watermelons'))).order_item.pack).to be_nil
      expect(instance.send(:exec, OrderLine.new(10, Item.new('watermelons'))).order_packs).to be_nil
    end

    it 'should return nil if an optimal order cannot be made up of packs' do
      instance = Shop.new(Order.new)

      expect(instance.send(:exec, OrderLine.new(1, Item.new('watermelons')))).to be_nil
    end
  end
end
