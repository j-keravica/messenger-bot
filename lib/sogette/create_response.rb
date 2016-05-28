module Sogette
  class CreateResponse

    def initialize(text)
      @text = text.downcase
    end

    def create
      response = {}

      if @text.includes? "cao"
        response["content"] << "Hej!"
      end

      if @text.includes? "kredit"
        response["content"] << "Imamo ovaj kredit =>"
        response["attachment"] << "attachment"
      end

      response
    end

  end
end
