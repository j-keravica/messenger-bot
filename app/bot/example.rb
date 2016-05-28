include Facebook::Messenger

Bot.on :message do |message|
  handler = MessageHandler.new(message)

  user = handler.create_user

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
  postback.payload   # => 'EXTERMINATE'

  if postback.payload == 'YES'
    puts "Human #{postback.recipient} said Yes"

    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "OK, 10 000 RSD sent to Milos. Your main account is now at 24 501 RSD."
      }
    )
  elsif postback.payload == 'NO'
    puts "Human #{postback.recipient} said No"

    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "Sure, anything else?"
      }
    )
  end
end
