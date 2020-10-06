# frozen_string_literal: true

require 'net/http'
require 'json'
# class for randomdog command
class Randomdog
  attr_reader :values
  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'https://dog.ceo/api/breeds/image/random'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
