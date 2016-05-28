include Facebook::Messenger

Bot.on :message do |message|
  handler = MessageHandler.new(message)

  user = handler.create_user

  resp = handler.create_response

  Bot.deliver(
    recipient: message.sender,
    message: {
      text: resp[:content]
    }
  )
end
