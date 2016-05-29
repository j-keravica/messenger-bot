module Messages
  class Numbers < Base

    BUZZ_WORDS = ["123456"]

    def self.options
      [
        {
          "attachment": {
            "type": "template",
            "payload": {
              "template_type": "button",
              "text": "That's 9450 00 RSD for electricity bill. May I pay?",
              "buttons":[
                {
                  "type": "postback",
                  "title": "Yes",
                  "payload": "YES_BILL"
                },
                {
                  "type": "postback",
                  "title": "No",
                  "payload": "NO"
                }
              ]
            }
          }
        }
      ]
    end

  end
end
