module Messages
  class Balance < Base

    BUZZ_WORDS = ["balance", "how much money", "how's my money", "hows my money"]

    def options
      main_account = nil
      eur_account = nil

      @user.accounts.each do |account|
        if account.currency == "RSD"
          main_account = account
        elsif account.currency == "EUR"
          eur_account = account
        end
      end

      message = "Balance on your main account is #{main_account.balance} RSD"
      if eur_account
        message << " your savings account stands at #{eur_account.balance} EUR."
      end

      [message]
    end

  end
end
