class Public::ExperiencesController < Public::BaseController
  def index
    @experiences = Experience.all.order(:order)
  end

  def show
    @experience = JSON.pretty_generate(Experience.find(params[:id]).as_json)
  end

  private
  def experience_params
    params.require(:experience).permit()
  end
end
