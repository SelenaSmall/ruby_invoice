require 'rspec'
require 'spec_helper'
require './lib/list'

describe List do
  describe '#selection' do
    it 'should return nil' do
      instance = List.new

      expect(instance.selection).to be_nil
    end
  end
end
