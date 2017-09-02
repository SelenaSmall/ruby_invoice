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

  describe '#packs' do
    it 'should return an Array of Packs' do
      instance = Item.new('Watermelons')

      expect(instance.packs('watermelon')).to be_a Array
    end
  end

  describe '#packs' do
    it 'should nil unless fruit is valid' do
      instance = Item.new('Watermelons')

      expect(instance.packs('hello')).to be_nil
    end
  end
end
