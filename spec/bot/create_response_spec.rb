require "rails_helper"

RSpec.describe CreateResponse do

  describe "#create" do

    before do
      @account = instance_double(Account, :currency => "RSD", :balance => 12000)
      @user = instance_double(User, :id => 1, :facebook_id => "123", :accounts => [@account])
      @response = CreateResponse.new(message, @user).create
    end

    context "plain messages" do
      context "Hi message" do
        let(:message) { "Hi there, how you doin?" }

        it "send Hi message" do
          expect(Messages::Hi::OPTIONS).to include(@response[:text])
        end
      end

      context "Ballance message" do
        let(:message) { "What's my balance" }

        it "send balance message" do
          expect(@response[:text]).to include("Balance on your main account is 12000")
        end
      end
    end

    context "buttons messages" do
      context "Bill message" do
        let(:message) { "Payday :'(" }

        it "send Bill message" do
          expect(@response).to have_key(:attachment)
        end
      end

      context "Numbers message" do
        let(:message) { "123456" }

        it "send Numbers message" do
          expect(Messages::Numbers::OPTIONS).to include(@response[:text])
        end
      end
    end

    context "Unprocessable message" do
      let(:message) { "Gibberish" }

      it "send Unprocessable message" do
        expect(@response[:text]).to eq(CreateResponse::UNPROCESSABLE[:content])
      end
    end
  end

end
