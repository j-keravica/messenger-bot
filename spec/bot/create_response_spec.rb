require "rails_helper"

RSpec.describe CreateResponse do

  describe "#create" do
    context "Hi message" do
      let(:message) { "Hi there, how you doin?" }

      before do
        @response = CreateResponse.new(message).create
      end

      it "send Hi message" do
        expect(@response).to eq(CreateResponse::HI)
      end
    end

    context "Loan message" do
      let(:message) { "Do you have a loan for me." }

      before do
        @response = CreateResponse.new(message).create
      end

      it "send Loan message" do
        expect(@response).to eq(CreateResponse::LOAN)
      end
    end

    context "Unprocessable message" do
      let(:message) { "Gibberish" }

      before do
        @response = CreateResponse.new(message).create
      end

      it "send Unprocessable message" do
        expect(@response).to eq(CreateResponse::UNPROCESSABLE)
      end
    end
  end

end
