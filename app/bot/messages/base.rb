module Messages
  class Base

    def self.content
      options[rand(options.length - 1)]
    end

    def self.attachment
      ""
    end

  end
end

