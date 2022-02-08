module Api
  module V1
    class ExperiencesController < Api::V1::BaseController
      def index
        @experiences = Experience.all.order(:order)
      end
        
      def show
        @experience = Experience.find(params[:id])
      end
        
      private
      def experience_params
        params.require(:experience).permit()
      end
    end
  end
end
