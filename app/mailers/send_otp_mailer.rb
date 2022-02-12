# frozen_string_literal: true

class SendOtpMailer < ApplicationMailer
  def send_otp
    @otp = params[:otp]
    @user = params[:user]
    @url = 'http://localhost:3000/admin/login' # pull the base for the url from envvar
    mail(to: @user.email, subject: "Your OTP is #{@otp}")
  end
end
