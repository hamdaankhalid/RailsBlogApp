# frozen_string_literal: true

module Public
  class ArticlesController < Public::BaseController
    def index
      @articles = Article.all.order(created_at: :desc)
      @subscription = Subscription.new
    end

    def show
      @article = Article.find(params[:id])
    end
  end
end
