# frozen_string_literal: true

require 'telegram_bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

# class for Randomdog command
class Randomdog
  @values = nil

  def initialize
    @values = make_the_request
  end

  def make_the_request
    url = 'https://dog.ceo/api/breeds/image/random'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
