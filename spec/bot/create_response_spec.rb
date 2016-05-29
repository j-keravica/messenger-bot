require "rails_helper"

RSpec.describe CreateResponse do

  describe "#create" do

    before do
      @user = User.create(:id => 1, :facebook_id => "123")
      @account = Account.create(:currency => "RSD", :balance => 12000000, :user_id => @user.id)
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

      context "Thanks message" do
        let(:message) { "Thank you" }

        it "send kiss message" do
          expect(@response[:text]).to include(":*")
        end
      end

      context "Numbers message" do
        let(:message) { "123456" }

        before do
          allow(@account).to receive(:update_attributes!)
        end

        it "send Numbers message" do
          expect(Messages::Numbers::OPTIONS).to include(@response[:text])
        end
      end
    end

    context "buttons messages" do
      context "Bill message" do
        let(:message) { "Pay my bills :'(" }

        it "send Bill message" do
          expect(@response).to have_key(:attachment)
        end
      end

      context "Payday message" do
        let(:message) { "Payday" }

        it "send Bill message" do
          expect(@response).to have_key(:attachment)
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
