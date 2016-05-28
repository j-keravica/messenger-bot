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
    HI[:content] if inside_a_message(["hey", "hello", "hi"])
  end

  def loan
    LOAN[:content] if inside_a_message(["loan", "loans"])
  end

  def unprocessable
    UNPROCESSABLE[:content]
  end

  def inside_a_message(words)
    words.any? { |word| @text.include? word }
  end

end
