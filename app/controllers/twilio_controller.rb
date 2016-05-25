class TwilioController < ApplicationController
  def send_sms
    message = params[:message]
    number = params[:number]
    account_sid = 'AC44f3b3867b82ebb365858dd213b0e9c9'
    auth_token = '9fa8a07fc6347b01b01c206ed43f80ab'



    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create({:to => "+1"+"#{number}",
                                      :from => "+16303435135",
                                      :body => "#{message}"})

      redirect_to '/'
  end
end
