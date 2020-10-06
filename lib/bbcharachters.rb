require 'net/http'
require 'json'
# this is a class for breaking bad api
class Bbcharachter
  attr_reader :values
  def initialize
    @values = make_the_request
  end

  def make_the_request
    url = 'https://www.breakingbadapi.com/api/character/random'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
