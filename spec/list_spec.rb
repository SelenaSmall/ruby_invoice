require 'rspec'
require 'spec_helper'
require './lib/list'

describe List do
  describe '#initialize' do
    it 'should have a watermelons attribute which is an array of Item.packs' do
      instance = List.new

      expect(instance.watermelons).to be_a Array
    end

    it 'should have a pineapples attribute which is an array of Item.packs' do
      instance = List.new

      expect(instance.pineapples).to be_a Array
    end

    it 'should have a rockmelons attribute which is an array of Item.packs' do
      instance = List.new

      expect(instance.rockmelons).to be_a Array
    end
  end

  describe '#selection' do
    it 'should return nil' do
      instance = List.new

      expect(instance.selection).to be_nil
    end
  end
end
