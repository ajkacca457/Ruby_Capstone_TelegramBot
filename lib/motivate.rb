require 'net/http'
require 'json'
# class for motivate command
class Motivate
  attr_reader :values
  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
