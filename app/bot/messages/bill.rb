module Messages
  class Bill < Base

    BUZZ_WORDS = ["bill", "bills", "pay", "payment"]

    def options
      [
        {
          "attachment": {
            "type": "template",
            "payload": {
              "template_type": "button",
              "text": "Sure thing. What would you like to pay?",
              "buttons":[
                {
                  "type": "postback",
                  "title": "Electricity",
                  "payload": "ELECTRICITY"
                },
                {
                  "type": "postback",
                  "title": "Internet",
                  "payload": "INTERNET"
                }
              ]
            }
          }
        }
      ]
    end

  end
end
