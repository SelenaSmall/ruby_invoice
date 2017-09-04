require 'rspec'
require 'spec_helper'
require './lib/invoice'

describe Invoice do
  describe '#print_order' do
    it 'should return nil' do
      instance = Invoice.new
      order = Order.new
      shop = Shop.new(order)

      shop.choose_items('10 watermelons')

      expect(instance.print_order(order)).to be_nil
    end
  end
end
