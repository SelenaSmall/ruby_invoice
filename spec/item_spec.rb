require 'rspec'
require 'spec_helper'
require './lib/item'

describe Item do
  describe '#initialize' do
    it 'should have a name attribute which is a String' do
      instance = Item.new('Watermelons')

      expect(instance.name).to be_a String
      expect(instance.name).to eq 'Watermelons'
    end
  end
end
