require 'rspec'
require 'spec_helper'
require './lib/item'

describe Item do
  describe '#initialize' do
    it 'should have a name attribute which is a String' do
      instance = Item.new('watermelons')

      expect(instance.name).to be_a String
      expect(instance.name).to eq 'watermelons'
    end

    it 'should have a pack attribute which is nil' do
      instance = Item.new('watermelons')

      expect(instance.pack).to be_nil
    end
  end

  describe '#packs' do
    it 'should return an Array of Packs' do
      instance = Item.new('watermelons')

      expect(instance.packs('watermelons')).to be_a Array
    end
  end

  describe '#packs' do
    it 'should nil unless fruit is valid' do
      instance = Item.new('watermelons')

      expect(instance.packs('hello')).to be_nil
    end

    it 'should return packs available for the fruit which is an Array' do
      instance = Item.new('watermelons')

      expect(instance.packs('watermelons')).to be_a Array
    end
  end

  describe '#watermelons' do
    it 'should an Array' do
      instance = Item.new('watermelons')

      expect(instance.send(:watermelons)).to be_a Array
    end

    it 'should an Array' do
      instance = Item.new('pineapples')

      expect(instance.send(:pineapples)).to be_a Array
    end

    it 'should an Array' do
      instance = Item.new('rockmelons')

      expect(instance.send(:rockmelons)).to be_a Array
    end
  end
end
