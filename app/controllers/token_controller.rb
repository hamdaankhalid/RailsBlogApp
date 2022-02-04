class TokenController < ApplicationController
  def create
    begin
      admin = Admin.find_by!("phone_number": params[:phone_number])
      uuid = SecureRandom.alphanumeric(5)
      admin.update(otp: uuid)
      SendOtpMailer.with(user: admin, otp: uuid).send_otp.deliver_now
      # enqueue to remove it in 5 mins
      OtpRemovalJob.set(wait: 5.minutes).perform_later(admin)
      flash.now[:success] = "OTP sent to phone"
      render "admin_authentication/new"
    rescue ActiveRecord::RecordNotFound
      flash.now[:danger] = "Phone number is not registered"
      render "admin_authentication/new"
    end
  end

  private

  def token_params
    params.permit(:phone_number, :authenticity_token, :commit)
  end
end
