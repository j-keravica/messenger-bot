class CreateResponse

  UNPROCESSABLE = { :content => "I'm sorry, I don't understand that yet. Can you rephrase it somehow? :)" }

  def initialize(text)
    @text = text.downcase
    @content = ""
  end

  def create
    @content = set_content

    # send buttons to a user if he wants to transfer his money
    if @content.empty?
      response = set_buttons
    else
      response = { text: @content }
    end
  end

  private

  def set_content
    "#{hi} #{balance} #{bill}".strip
  end

  def set_buttons
    @content = transfer

    @content ||= { text: UNPROCESSABLE[:content] }
  end

  def hi
    Messages::Hi.content if inside_a_message(Messages::Hi::BUZZ_WORDS)
  end

  def balance
    Messages::Balance.content if inside_a_message(Messages::Balance::BUZZ_WORDS)
  end

  def transfer
    Messages::Transfer.content if inside_a_message(Messages::Transfer::BUZZ_WORDS)
  end

  def bill
    Messages::Bill.content if inside_a_message(Messages::Bill::BUZZ_WORDS)
  end

  def unprocessable
    UNPROCESSABLE[:content]
  end

  def inside_a_message(words)
    words.any? { |word| @text.include? word }
  end

end
