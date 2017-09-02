require 'rspec'
require 'spec_helper'
require './lib/handle_input'

describe HandleInput do
  describe '#interpret' do
    it 'should return nil unless command matches a value in ACTIONS array' do
      instance = HandleInput.new

      expect(instance.interpret('hello')).to be_nil
    end
  end

  describe '#shop' do
    before do
      $stdin = StringIO.new('3 watermelon')
    end

    it 'should return an instance of OrderLine' do
      instance = HandleInput.new

      expect(instance.shop).to be_a OrderLine
    end
  end
end
