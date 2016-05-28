class CreateResponse

  HI = { :content => "What's up?",
         :attachment => "" }
  LOAN = { :content => "In our offer, we have these loans available",
           :attachment => "" }
  UNPROCESSABLE = { :content => "Sorry, I can't process that :(",
                    :attachment => ""}

  def initialize(text)
    @text = text.downcase
  end

  def create
    content = "#{hi} #{loan}".strip

    content = UNPROCESSABLE[:content] if content.empty?

    response = { :content => content, :attachment => "" }
  end

  private

  def hi
    HI[:content] if @text.include? "hi"
  end

  def loan
    LOAN[:content] if @text.include? "loan"
  end

  def unprocessable
    UNPROCESSABLE[:content]
  end

end
