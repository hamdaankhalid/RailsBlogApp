class CodeReminder::CodeRemindersController < InheritedResources::Base
  before_action :check_link_token, only: [:edit, :update, :destroy]

  # visible to public
  def new
    @code_reminder = CodeReminder.new
  end

  # visible for public to use
  def create
    @code_reminder = CodeReminder.new(code_reminder_params)
    if @code_reminder.save
      flash[:notice] = 'Code Reminder was successfully created'
      token_checker = TokenChecker.new
      token = token_checker.generate_token(@code_reminder.email, 120_000)
      logger.info(token)
      redirect_to new_code_reminder_path
    else
      render :new
    end
  end

  # visible only via link token
  def edit
    @code_reminder = CodeReminder.find(params[:id])
  end

  # visible only via link token
  def update
    @code_reminder = CodeReminder.find(params[:id])
    flash[:notice] = 'Code Reminder was successfully updated.' if @code_reminder.update(code_reminder_params)
    render :edit
  end

  # visible only via link token
  def destroy
    CodeReminder.destroy(params[:id])
  end

  private

  def code_reminder_params
    params.require(:code_reminder).permit(:email, :cadence, :cadence_unit)
  end

  def check_link_token
    token_checker = TokenChecker.new
    if token_checker.valid_token?(params[:token])
      render plain: 'Unauthorized', status: :forbidden
      retunr false
    end

    code_reminder = CodeReminder.find(params[:id])
    if code_reminder.nil?
      render plain: 'Not Found', status: :not_found
      return false
    end

    token_email = token_checker.get_payload(params[:token])
    if code_reminder.email != token_email
      render plain: 'Unauthorized', status: :forbidden
      return false
    end

    true
  end
end
