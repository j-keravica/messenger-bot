class CreateResponse

  def initialize(text)
    @text = text.downcase
  end

  def create
    response = {}

    if @text.includes? "hi"
      response["content"] << "Hi there! How can I help you today?"
    end

    if @text.includes? "loan"
      response["content"] << "In our offer, we have these loans available"
      response["attachment"] << "attachment"
    end

    response
  end

end
