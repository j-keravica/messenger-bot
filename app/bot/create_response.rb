class CreateResponse

  UNPROCESSABLE = { :content => "I'm sorry, I don't understand that yet. I was only born yesterday :( " }

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
    hi || balance || numbers || thanks
  end

  def set_buttons
    @content = bill || payday
    @content ||= { text: UNPROCESSABLE[:content] }
  end

  # plain messages

  def hi
    Messages::Hi.content if inside_a_message(Messages::Hi::BUZZ_WORDS)
  end

  def balance
    Messages::Balance.content(@user) if inside_a_message(Messages::Balance::BUZZ_WORDS)
  end

  def numbers
    if number?
      pay_bills
      Messages::Numbers.content
    end
  end

  def thanks
    Messages::Thanks.content if inside_a_message(Messages::Thanks::BUZZ_WORDS)
  end

  # buttons messages

  def bill
    Messages::Bill.content if inside_a_message(Messages::Bill::BUZZ_WORDS)
  end

  def payday
    Messages::Payday.content if inside_a_message(Messages::Payday::BUZZ_WORDS)
  end

  # unprocessable

  def unprocessable
    UNPROCESSABLE[:content]
  end

  def inside_a_message(words)
    words.any? { |word| @text.split.include? word }
  end

  def number?
    !!/\A\d+\z/.match(@text)
  end

  def pay_bills
    account = @user.accounts.first
    bill = @text.to_i
    new_balance = account.balance - bill
    account.update_attributes!(:balance => new_balance)
  end

end
