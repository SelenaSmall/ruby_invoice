require 'rspec'
require 'spec_helper'
require './lib/pack'

describe Pack do
  describe '#initialize' do
    it 'should have a qty attribute which is an Integer' do
      instance = Pack.new(3, 6.99)

      expect(instance.qty).to be_a Integer
      expect(instance.qty).to eq 3
    end

    it 'should have a price attribute which is an instance of Money' do
      instance = Pack.new(3, Money.new(699, 'NZD'))

      expect(instance.price).to be_a Money
    end
  end
end
