require 'spec_helper'

def mock_up(filename)
  mock = File.open("spec/fixtures/#{filename}.html").read
  allow(RestClient).to receive(:get) { mock }
end

describe Lita::Handlers::OnewheelSqspush, lita_handler: true do
  it 'cocks about' do
    # mock_up 'fil'
    send_command 'weirdai test'
    expect(replies.last).to include('test')
  end
end
