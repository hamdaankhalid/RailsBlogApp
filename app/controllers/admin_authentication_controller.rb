class AdminAuthenticationController < ApplicationController
  include AdminAuthenticationHelper

  def new
  end

  def create
    begin
      admin = Admin.find_by!(email: params[:email])
      if admin.otp == params[:otp]
        log_in(admin)
        redirect_to "/admin"
      else
        # forbidden error
        flash.now[:danger] = "Incorrect OTP"
        render "admin_authentication/new", :forbidden
      end
    rescue ActiveRecord::RecordNotFound
      flash.now[:danger] = "Email is not registered"
      render "admin_authentication/new", :bad_request
    end
  end

  def destroy
    log_out
    redirect_to root_path, status: :see_other
  end

  private

  def create_session_params
    params.permit(:email, :authenticity_token, :otp, :commit)
  end
end
