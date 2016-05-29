require "rails_helper"

RSpec.describe MessageHandler do

  let(:message) do
    double("message",
          :sender => { "id" => "123456" },
          :sent_at => "2016-04-22 21:30:36 +0200",
          :text => "hello",
          :attachments => [])
  end

  describe "#create_response" do
    it "finds or creates user by her facebook id" do
      handler = MessageHandler.new(message)
      handler.create_response
      expect(::User.find_by_facebook_id("123456")).to_not be_nil
    end
  end
end
