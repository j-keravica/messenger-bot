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
  @payload = postback.payload   # => 'EXTERMINATE'

  puts "Human #{postback.recipient} said #{@payload}"

  case @payload
  when "YES"
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "OK, 10 000 RSD sent to Milos. Your main account is now at 24 501 RSD."
      }
    )
  when "NO"
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "Sure, anything else?"
      }
    )
  when "YES_BILL"
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "Your bill is now paid. Your main account is now at 15 051 RSD."
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
