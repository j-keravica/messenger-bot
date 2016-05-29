module Messages
  class Base

    def self.content(user=nil)
      new(user).options.sample
    end

    def self.attachment
      ""
    end

    def options
      raise "Not implemented"
    end

    private

    def initialize(user)
      @user = user
    end

  end
end

