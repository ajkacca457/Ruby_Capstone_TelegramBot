# frozen_string_literal: true

# rubocop:disable Lint/UriEscapeUnescape
require 'telegram_bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'
# class for Harrypotterhouse command
class Harrypotterhouse
  @values = nil

  def initialize
    @values = @make_the_request
  end

  def make_the_request
    url = 'https://www.potterapi.com/v1/sortingHat'

    escaped_address = URI.escape(url)
    uri = URI.parse(escaped_address)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
# rubocop: enable Lint/UriEscapeUnescape
