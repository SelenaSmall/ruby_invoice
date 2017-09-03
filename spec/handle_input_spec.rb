require 'rspec'
require 'spec_helper'
require './lib/handle_input'

describe HandleInput do
  describe '#initialize' do
    it 'should have an order attribute which is an instance of Order' do
      instance = HandleInput.new(Order.new)

      expect(instance.order).to be_a Order
    end

    it 'should have an invoice attribute which is an instance of Invoice' do
      instance = HandleInput.new(Order.new)

      expect(instance.invoice).to be_a Invoice
    end
  end

  describe '#interpret' do
    it 'should return nil unless command matches a value in ACTIONS array' do
      instance = HandleInput.new(Order.new)

      expect(instance.interpret('hello')).to be_nil
    end

    it 'should return nil if command matches VIEW' do
      instance = HandleInput.new(Order.new)

      expect(instance.interpret('VIEW')).to be_nil
    end

    before do
      $stdin = StringIO.new('3 watermelons')
      $stdin = StringIO.new('BACK')
    end

    it 'should return nil if command matches SHOP' do
      instance = HandleInput.new(Order.new)

      expect(instance.interpret('SHOP')).to be_nil
    end
  end

  describe '#shop_menu' do
    before do
      $stdin = StringIO.new('3 watermelons')
      $stdin = StringIO.new('BACK')
    end

    it 'should return nil' do
      instance = HandleInput.new(Order.new)

      expect(instance.send(:shop_menu)).to be_nil
    end
  end

  describe '#shop' do
    before do
      $stdin = StringIO.new('3 watermelons')
    end

    it 'should return an instance of OrderLine' do
      instance = HandleInput.new(Order.new)

      expect(instance.send(:shop, '10 watermelons')).to be_a OrderLine
    end

    it 'should return nil if input does not match PATTERN' do
      instance = HandleInput.new(Order.new)

      expect(instance.send(:shop, 'fruit')).to be_nil
    end
  end

  describe '#exec' do
    it 'should return an instance of OrderLine' do
      instance = HandleInput.new(Order.new)

      expect(instance.send(:exec, OrderLine.new(10, Item.new('watermelons')))).to be_a OrderLine
    end
  end
end
