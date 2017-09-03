require 'rspec'
require 'spec_helper'
require './lib/invoice'

describe Invoice do
  describe '#initialize' do
    it 'should have a printorder attribute which is an Array' do
      instance = Invoice.new

      expect(instance.printorder).to be_a Array
    end
  end

  describe '#print_order' do
    it 'should return nil' do
      instance = Invoice.new

      expect(instance.print_order(Order.new)).to be_nil
    end
  end
end
