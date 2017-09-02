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
end
