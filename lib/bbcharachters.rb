require 'telegram_bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'
# class for breaking bad command
class Bbcharachter
  @values = nil

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
