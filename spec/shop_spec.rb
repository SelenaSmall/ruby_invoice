require 'rspec'
require 'spec_helper'
require './lib/shop'

describe Shop do
  describe '#initialize' do
    it 'should have an order attribute which is an instance of Order' do
      instance = Shop.new(Order.new)

      expect(instance.order).to be_a Order
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
    end

    it 'should return nil if an optimal order cannot be made up of packs' do
      instance = Shop.new(Order.new)

      expect(instance.send(:exec, OrderLine.new(1, Item.new('watermelons')))).to be_nil
    end
  end
end
