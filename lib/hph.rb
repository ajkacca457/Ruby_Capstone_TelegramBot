require 'net/http'
require 'json'
# class for house command
class Harrypotterhouse
  attr_reader :values
  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'https://www.potterapi.com/v1/sortingHat'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
