class CreateResponse

  UNPROCESSABLE = { :content => "I'm sorry, I don't understand that yet. Can you rephrase it somehow? :)" }

  def initialize(text, user)
    @text = text.downcase
    @user = user
    @content = ""
  end

  def create
    @content = set_content

    # if @content is not already set, we are dealing with
    # buttons message

    if @content.nil?
      response = set_buttons
    else
      response = { text: @content }
    end
  end

  private

  def set_content
    hi || balance || bill
  end

  def set_buttons
    @content = transfer || numbers

    @content ||= { text: UNPROCESSABLE[:content] }
  end

  # plain messages

  def hi
    Messages::Hi.content if inside_a_message(Messages::Hi::BUZZ_WORDS)
  end

  def balance
    Messages::Balance.content if inside_a_message(Messages::Balance::BUZZ_WORDS)
  end

  def bill
    Messages::Bill.content if inside_a_message(Messages::Bill::BUZZ_WORDS)
  end

  # buttons messages

  def transfer
    Messages::Transfer.content if inside_a_message(Messages::Transfer::BUZZ_WORDS)
  end

  def numbers
    Messages::Numbers.content if inside_a_message(Messages::Numbers::BUZZ_WORDS)
  end

  # unprocessable

  def unprocessable
    UNPROCESSABLE[:content]
  end

  def inside_a_message(words)
    words.any? { |word| @text.include? word }
  end

end
