# frozen_string_literal: true

module Public
  class ArticlesController < Public::BaseController
    def index
      @articles = Article.where(status: :public).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
      @subscription = Subscription.new
    end

    def show
      @article = Article.find(params[:id])
    end
  end
end
