require "rails_helper"

RSpec.describe "receiving a hook from Facebook" do

  subject { Facebook::Messenger::Bot }

  let(:hook) { proc { |_args| } }
  let(:message_id) { 'mid.1456970487936:c34767dfe57ee6e339' }
  let(:payload) do
    {
      recipient: {
        id: '123'
      },
      message: {
        text: 'Hello, human!'
      }
    }
  end
  let(:messages_url) do
    Facebook::Messenger::Subscriptions.base_uri + '/messages'
  end
  let(:access_token) { Facebook::Messenger.config.access_token }

  context 'with a valid event' do
    before do
      stub_request_to_return(
        recipient_id: '1008372609250235',
        message_id: message_id
      )
    end

    it 'sends a message' do
      expect(subject.deliver(payload)).to eq(message_id)
    end
  end

  def stub_request_to_return(hash)
    stub_request(:post, messages_url)
      .with(
        query: { access_token: access_token },
        body: payload,
        headers: { 'Content-Type' => 'application/json' }
      )
      .to_return(
        body: JSON.dump(hash),
        headers: default_graph_api_response_headers
      )
  end

  def default_graph_api_response_headers
    {
      'Content-Type' => 'text/javascript; charset=UTF-8'
    }
  end
end
