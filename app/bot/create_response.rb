class CreateResponse

  def initialize(text)
    @text = text.downcase
  end

  def create
    response = { :content => "", :attachment => "" }

    if @text.include? "hi"
      response[:content] << "Hi there! How can I help you today?"
    end

    if @text.include? "loan"
      response[:content] << "In our offer, we have these loans available"
      response[:attachment] << "attachment"
    end

    response
  end

end
