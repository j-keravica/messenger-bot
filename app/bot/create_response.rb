class CreateResponse

  HI = { :content => "What's up?",
         :attachment => "" }

  LOAN = { :content => "In our offer, we have these loans available",
           :attachment => "" }

  BALANCE = { :content => "Balance on your main account is 34 501 dinars,

                           Your savings account stands at 1864 euros.",
              :attachment => "" }

  UNPROCESSABLE = { :content => "I'm sorry, I don't understand that yet. Can you rephrase it somehow? :)",
                    :attachment => ""}

  def initialize(text)
    @text = text.downcase
  end

  def create
    content = "#{hi} #{loan} #{balance}".strip

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

  def balance
    BALANCE[:content] if inside_a_message(["balance"])
  end

  def unprocessable
    UNPROCESSABLE[:content]
  end

  def inside_a_message(words)
    words.any? { |word| @text.include? word }
  end

end
