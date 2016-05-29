class MessageHandler

  def initialize(message)
    @message = message
    @text = @message.text
  end

  def create_response
    user = find_user
    response = CreateResponse.new(@text, user)

    response.create
  end

  private

  def find_user
    facebook_id = @message.sender["id"]
    ::User.find_or_create_by(:facebook_id => facebook_id)
  end

end
