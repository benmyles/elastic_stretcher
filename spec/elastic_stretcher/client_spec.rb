require_relative '../spec_helper'

describe Client do

  it "can be opened and closed" do
    @client = Client.new
    @client.closed?.must_equal false
    @client.close.must_equal true
    @client.closed?.must_equal true
  end

end