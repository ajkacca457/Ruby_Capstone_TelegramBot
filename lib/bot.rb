# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/IndentationConsistency
require 'telegram_bot'
require_relative '../lib/chucknorris.rb'
require_relative '../lib/bbcharachters.rb'
require_relative '../lib/hph.rb'
require_relative '../lib/motivate.rb'
require_relative '../lib/randomdog.rb'
require_relative '../lib/randomfact.rb'
# this is a class Bot application
class Bot
  attr_reader :bot, :get_updates

  def initialize
    token = '1331572713:AAHUBQRhsWNHaPIcQ0OmCA0ha7B8tZcR-Bs'
    @bot = TelegramBot.new(token: token)
    @get_updates = update
  end

  private

  def update
    @bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(@bot)

      message.reply do |reply|
        case command

        when /start/i
          instructions = ['Welcome to smartbot type /help to know all about
                      smartbot',
                          'Nice to have you here type /help to know all about
                        smartbot',
                          'How is it going today? type /help to know all about
                        smartbot',
                          'Want any help to start? type /help to know all about
                      smartbot']
          reply.text = "#{instructions.sample.capitalize},
      #{message.from.first_name}!"

        when /help/i
          reply.text = "/greet : sends you greeting in different language,
                    /motivate :motivates you with amazing motivation quotes,
                    /norris :sends you random chuck norris joke,
                    /dogtoday :sends you cute puppy and dog pics,
                    /bb : tells you which breaking bad charachter you are,
                    /fact : educates you with random facts and gq.
                    /Harrypotter: Select you in a harry potter house.
                    "
        when /greet/i
          greetings = %w[bonjour hola hallo sveiki namaste salaam szia halo ciao]
          reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}!"

        when '/norris'
          values = Norris.new
              value = values.make_the_request
              reply.text = "#{value['value']}. 🤖"

        when '/motivate'
          values = Motivate.new
          value = values.select_random
          reply.text = "#{value['text']}. 🤖"

        when '/dogtoday'
          values = Randomdog.new
              value = values.make_the_request
              reply.text = "#{value['message']}. 🤖"

        when '/bb'
          values = Bbcharachter.new
              value = values.make_the_request
              puts reply.text = "you are : #{value[0]['name']}. #{value[0]['img']}
          from Breaking Bad 🤖"
        when '/fact'
          values = Facts.new
              value = values.make_the_request
              puts reply.text = "today's fact is :#{value['text']}🤖"
        when '/Harrypotter'
          values = Harrypotterhouse.new
              value = values.make_the_request
              puts reply.text = "You are a part of ..#{value}🤖"
        else
          otherresponse = ['I have no idea what it means try /help',
                           'Are you sure you wrote the right command? try /help to
                        check',
                           'what do you want to do? try /help to check']
          reply.text = "#{otherresponse.sample.capitalize},
      #{message.from.first_name}!"
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/BlockLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Layout/IndentationConsistency
