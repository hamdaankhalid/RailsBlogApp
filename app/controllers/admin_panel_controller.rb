require '././lib/exceptions'

class AdminPanelController < ApplicationController
  include AdminAuthenticationHelper
  include Exceptions

  before_action :authenticated_only

  rescue_from AuthenticationError, with: :show_unauthenticated

  def index
    @admin = current_user
  end
end
