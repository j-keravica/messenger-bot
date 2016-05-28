require "rails_helper"

RSpec.describe CreateResponse do

  describe "#create" do
    context "Hi message" do
      let(:message) { "Hi there, how you doin?" }

      before do
        @response = CreateResponse.new(message).create
      end

      it "send Hi message" do
        expect(Messages::Hi.options).to include(@response[:content])
      end
    end

    context "Ballance message" do
      let(:message) { "What's my balance" }

      before do
        @response = CreateResponse.new(message).create
      end

      it "send Loan message" do
        expect(Messages::Balance.options).to include(@response[:content])
      end
    end

    context "Transfer message" do
      let(:message) { "Transfer 100 bucks to Milos." }

      before do
        @response = CreateResponse.new(message).create
      end

      it "send Transfer message" do
        expect(Messages::Transfer.options).to include(@response[:content])
      end
    end

    context "Unprocessable message" do
      let(:message) { "Gibberish" }

      before do
        @response = CreateResponse.new(message).create
      end

      it "send Unprocessable message" do
        expect(@response[:content]).to eq(CreateResponse::UNPROCESSABLE[:content])
      end
    end
  end

end
