require_relative '../lib/hph.rb'

describe do
  let(:house) { Harrypotterhouse.new }
  describe '#initialize' do
    let(:values) { house.values }
    it 'returns true for objects parsed to array' do
      expect(values.is_a?(String)).to eql(true)
    end
  end
  context '#make_the_request' do
    it 'returns false for returned object is not an array' do
      expect(house.values.is_a?(Array)).to eql(false)
    end
  end

  context '#make_the_request' do
    it 'returns false for a hash object not having two or more key/value pairs' do
      expect(house.values.is_a?(Hash)).to eql(false)
    end
  end
end
