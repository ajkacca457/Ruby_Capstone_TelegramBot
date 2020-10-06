# frozen_string_literal: true

require_relative '../lib/chucknorris.rb'

describe do
  let(:jokes) { Norris.new }
  describe '#initialize' do
    let(:values) { jokes.values }
    it 'returns false for returned value is not an array' do
      expect(values.is_a?(Array)).to eql(false)
    end
  end

  context '#make_the_request' do
    it 'returns true for a hash object having two or more key/value pairs' do
      expect(jokes.values.is_a?(Hash)).to eql(true)
    end
  end
end
