include Facebook::Messenger

Bot.on :message do |message|
  handler = MessageHandler.new(message)

  resp = handler.create_response

  print "User ID=#{message.sender}"
  print " "
  print "Message sent=#{resp}"

  Bot.deliver(
    recipient: message.sender,
    message: resp
  )
end

Bot.on :postback do |postback|
  postback.sender    # => { 'id' => '1008372609250235' }
  postback.recipient # => { 'id' => '2015573629214912' }
  postback.sent_at   # => 2016-04-22 21:30:36 +0200
  @payload = postback.payload   # => 'EXTERMINATE'

  puts "Human #{postback.recipient} said #{@payload}"

  case @payload
  when "YES_PLAN"
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "... and done! :)"
      }
    )
  when "ELECTRICITY"
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "How much for electricity this month?"
      }
    )
  when "INTERNET"
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "How much for internet this month?"
      }
    )
  end
end
