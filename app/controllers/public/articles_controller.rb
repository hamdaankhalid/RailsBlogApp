class Public::ArticlesController < Public::BaseController
  def index
    @articles = Article.all()
    @subscription = Subscription.new
  end

  def show
    @article = Article.find(params[:id])
  end
end
