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
