class TwilioController < ApplicationController
  def send_sms

    begin
    message = params[:message]
    number = params[:number]
    account_sid = 'AC44f3b3867b82ebb365858dd213b0e9c9'
    auth_token = '9fa8a07fc6347b01b01c206ed43f80ab'



    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create({:to => "+1"+"#{number}",
                                      :from => "+16303435135",
                                      :body => "#{message}"})

      flash[:notice] = "Message sent!"
      redirect_to '/'
    rescue
      flash[:alert] = "Please enter in a valid phone number and message then try again!"
      redirect_to '/'
    end
  end
end
