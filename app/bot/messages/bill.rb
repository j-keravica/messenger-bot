module Messages
  class Bill < Base

    BUZZ_WORDS = ["bill", "bills"]

    def self.options
      ["Sure, can you just give me the bill numbers? I'll fill out the rest for you.",
       "OK, I'll just need the bill numbers. I'll fill out the rest for you."]
    end

  end
end
