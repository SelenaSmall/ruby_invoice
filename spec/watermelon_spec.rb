require 'rspec'
require 'spec_helper'
require './lib/watermelon'

describe Watermelon do
  describe '#initialize' do
    it 'should have a pack attribute which is nil' do
      instance = Watermelon.new

      expect(instance.pack).to be_nil
    end
  end

  describe '#pack_size' do
    it 'should return nil if selection is not present in OPTIONS array' do
      instance = Watermelon.new

      expect(instance.pack_sizes(1)).to be_nil
    end

    it 'should return an instance of Pack if selection is present in OPTIONS array' do
      instance = Watermelon.new

      expect(instance.pack_sizes(3)).to be_a Pack
    end
  end
end
