module Messages
  class Hi < Base

    BUZZ_WORDS = ["hey", "hello", "hi", "holla"]
    OPTIONS = ["What's up?", "Hey there.", "Oh, hi.", "Hello there."]

    def options
      OPTIONS
    end
  end
end
