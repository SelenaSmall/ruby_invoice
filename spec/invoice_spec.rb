require 'rspec'
require 'spec_helper'
require './lib/invoice'

describe Invoice do
  describe '#print_order' do
    it 'should return nil' do
      instance = Invoice.new

      expect(instance.print_order(Order.new)).to be_nil
    end
  end
end
