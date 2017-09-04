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

    it 'should have a list attribute which is an instance of List' do
      instance = HandleInput.new(Order.new)

      expect(instance.list).to be_a List
    end

    it 'should have a shop attribute which is an instance of Shop' do
      instance = HandleInput.new(Order.new)

      expect(instance.shop).to be_a Shop
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
end
