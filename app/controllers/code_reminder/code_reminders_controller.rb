class CodeReminder::CodeRemindersController < InheritedResources::Base
  def index
    @code_reminders = CodeReminder.all
  end

  def new
    @code_reminder = CodeReminder.new
  end

  def create
    @code_reminder = CodeReminder.new(code_reminder_params)
    if @code_reminder.save
      flash[:notice] = 'Code Reminder was successfully created'
      redirect_to @code_reminder
    else
      render :new
    end
  end

  def show
    @code_reminder = CodeReminder.find(params[:id])
  end

  def edit
    @code_reminder = CodeReminder.find(params[:id])
  end

  def update
    @code_reminder = CodeReminder.find(params[:id])
    if @code_reminder.update(code_reminder_params)
      flash[:notice] = 'Code Reminder was successfully updated.'
      redirect_to @code_reminder
    else
      render :edit
    end
  end

  def destroy
    CodeReminder.destroy(params[:id])
    flash[:notice] = 'Code Reminder was successfully deleted.'
    redirect_to code_reminders_path
  end

  private

  def code_reminder_params
    params.require(:code_reminder).permit(:email, :cadence, :cadence_unit)
  end
end
