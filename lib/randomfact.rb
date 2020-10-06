require 'net/http'
require 'json'
# class for fact command
class Facts
  attr_reader :values
  def initialize
    @values = make_the_request
  end

  def select_random
    @values = @values.sample
    @values
  end

  def make_the_request
    url = 'https://uselessfacts.jsph.pl/random.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
