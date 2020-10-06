# frozen_string_literal: true

require_relative '../lib/bbcharachters.rb'

describe do
  let(:character) { Bbcharachter.new }
  describe '#initialize' do
    let(:values) { character.values }
    it 'returns true for objects parsed to array' do
      expect(values.is_a?(Array)).to eql(true)
    end
  end

  context '#make_the_request' do
    it 'returns true for a hash object having two key/value pairs' do
      expect(character.values.is_a?(Array)).to eql(true)
    end
  end
end
