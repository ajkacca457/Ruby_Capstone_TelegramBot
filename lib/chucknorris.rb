# rubocop:disable Lint/UriEscapeUnescape
require 'telegram_bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Norris
  @values = nil

  def initialize
    @values = @make_the_request
  end

  def make_the_request
    url = 'https://api.chucknorris.io/jokes/random'

    escaped_address = URI.escape(url)
    uri = URI.parse(escaped_address)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end

# rubocop: enable Lint/UriEscapeUnescape
