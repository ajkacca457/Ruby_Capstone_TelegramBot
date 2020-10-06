# frozen_string_literal: true

require_relative '../lib/motivate.rb'

describe Motivate do
  let(:quote) { Motivate.new }
  describe '#initialize' do
    let(:values) { quote.values }
    it 'returns true for objects parsed to array' do
      expect(values.is_a?(Array)).to eql(true)
    end
  end

  context '#select_random' do
    it 'returns true for a hash object having two key/value pairs' do
      expect(quote.select_random.size).to eql(2)
    end
  end

  context '#select_random' do
    it 'returns false for a hash object having two key/value pairs' do
      expect(quote.select_random.size).not_to eql(1)
    end
  end

  context '#make_the_request' do
    it 'returns false for a hash object having two key/value pairs' do
      expect(quote.values.is_a?(Array)).to eql(true)
    end
  end
end
