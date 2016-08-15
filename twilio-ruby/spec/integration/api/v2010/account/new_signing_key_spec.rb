##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

require 'spec_helper.rb'

describe 'NewSigningKey' do
  it "can create" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))
    
    expect {
      @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .new_signing_keys.create()
    }.to raise_exception(Twilio::REST::TwilioException)
    
    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/SigningKeys.json',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        201,
      %q[
      {
          "sid": "SKaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "foo",
          "date_created": "Mon, 13 Jun 2016 22:50:08 +0000",
          "date_updated": "Mon, 13 Jun 2016 22:50:08 +0000",
          "secret": "foobar"
      }
      ]
    ))
    
    actual = @client.api.v2010.accounts("ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .new_signing_keys.create()
    
    expect(actual).to_not eq(nil)
  end
end