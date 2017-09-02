require 'rspec'
require 'spec_helper'
require './lib/basket'

describe Basket do
  describe '#initialize' do
    it 'should have a current_order attribute which is a nil' do
      instance = Basket.new

      expect(instance.current_order).to be_nil
    end
  end
end
