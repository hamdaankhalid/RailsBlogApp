# frozen_string_literal: true

module Public
  class ExperiencesController < Public::BaseController
    def index
      @experiences = Experience.all.order(:order)
    end

    def show
      @experience = JSON.pretty_generate(
        Experience.find(params[:id]).attributes.except(
          'created_at',
          'updated_at',
          'id',
          'order'
        ).as_json
      )
    end

    private

    def experience_params
      params.require(:experience).permit
    end
  end
end
