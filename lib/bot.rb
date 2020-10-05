# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
# rubocop:disable Style/RedundantInterpolation
# rubocop:disable Layout/IndentationConsistency
require 'telegram_bot'
require_relative 'motivate.rb'
require_relative 'chucknorris.rb'
require_relative 'randomdog.rb'

token = '1331572713:AAHUBQRhsWNHaPIcQ0OmCA0ha7B8tZcR-Bs'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)


  puts "welcome to the smartbot"

  message.reply do |reply|
    case command

    when /start/i
      instructions=['Welcome to smartbot type /help to know all about smartbot',
        'Nice to have you here type /help to know all about smartbot',
        'How is it going today? type /help to know all about smartbot',
        'Want any help to start? type /help to know all about smartbot',]
      reply.text = "#{instructions.sample.capitalize}, #{message.from.first_name}!"

    when  /help/i
      reply.text = "/greet : sends you greeting in different language,
                    /motivate :motivates you with amazing motivation quotes,
                    /norris :sends you random chuck norris joke,
                    /dogtoday :sends you cute puppy and dog pics,
                    /bb : tells you which breaking bad charachter you are,
                    /fact : educates you with random facts and gq.
                    /Harrypotter: Select you in a harry potter house.
                    "
    when /greet/i
        greetings = ['bonjour', 'hola', 'hallo', 'sveiki', 'namaste', 'salaam', 'szia', 'halo', 'ciao']
        reply.text = "#{greetings.sample.capitalize}, #{message.from.first_name}!"

    when '/motivate'
           values = Motivate.new
           value = values.select_random
           reply.text = "#{value['text']}. 🤖"

    when '/norris'
          values = Norris.new
          value = values.make_the_request
          reply.text = "#{value['value']}. 🤖"

    when '/dogtoday'
          values = Randomdog.new
          value = values.make_the_request
          reply.text = "#{value['message']}. 🤖"
    else

      reply.text = "I have no idea what #{command.inspect} means."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end


# rubocop: enable Metrics/MethodLength
# rubocop: enable Layout/LineLength
# rubocop: enable Style/RedundantInterpolation
# rubocop: enable Layout/IndentationConsistency
