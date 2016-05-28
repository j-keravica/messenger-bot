module Messages
  class Transfer < Base

    BUZZ_WORDS = ["transfer"]

    # Set of random options for "transfer" message that came from the user
    def self.options
      [
        {
          "type": "template",
          "payload": {
            "template_type": "button",
            "text": "You don't have that much right now. Did you mean 10.000 RSD?",
            "buttons":[
              {
                "type": "postback",
                "title": "Yes",
                "payload": "YES"
              },
              {
                "type": "postback",
                "title": "No",
                "payload": "NO"
              }
            ]
          }
        }
      ]
    end

    def self.attachment
      ""
    end

  end
end
