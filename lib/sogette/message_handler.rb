module Sogette
  class MessageHandler

    def initialize(message)
      @message = message
    end

    def create_user
      @facebook_id = @message.sender
      @sent_at = @message.sent_at
      @text = @message.text
      @attachments = @message.attachments

      user = ::User.find_or_create_by(:facebook_id => @facebook_id)
    end

    def create_response
      response = CreateResponse.new(@text)

      response.create
    end

  end
end
