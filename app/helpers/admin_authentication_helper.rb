require '././lib/exceptions'

module AdminAuthenticationHelper
  include Exceptions

  def log_in(admin)
    session[:user_id] = admin.id
  end

  def log_out
    session[:user_id] = nil
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Admin.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def authenticated_only
    raise AuthenticationError unless logged_in?
    return true
  end

  def show_unauthenticated
    flash[:danger] = "Please Log In"
    redirect_to "/admin/login"
  end
end
