module Messages
  class Payday < Base

    BUZZ_WORDS = ["payday", "paycheck"]
    OPTIONS = []

    def options
      [
        {
          "attachment": {
            "type": "template",
            "payload": {
              "template_type": "button",
              "text": "Horray! Here's your average plan: around #{average_bills} RSD for bills, 21.985 RSD for food, 2200 RSD for gym, 3400 RSD laptop rate and you set a goal to buy Leon's birthday gift. That leaves you: 65855 RSD. Do you want me to apply your budget plan?",
              "buttons":[
                {
                  "type": "postback",
                  "title": "Yes",
                  "payload": "YES_PLAN"
                },
                {
                  "type": "postback",
                  "title": "No",
                  "payload": "NO_PLAN"
                }
              ]
            }
          }
        }
      ]
    end

    def average_bills
      9560
    end

  end
end
