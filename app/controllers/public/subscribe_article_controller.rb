class Public::SubscribeArticleController < Public::BaseController
  def create
    begin
      subscribed = Subscription.create!(subscribe_params)
      SubscribeToArticleJob.perform_later(subscribed)
      flash[:success]="You are subscribed!"
      redirect_to articles_path, status => :created
    rescue ActiveRecord::RecordInvalid
      flash[:success]="Looks like you are already on our subscription list :)"
      redirect_to articles_path, status => :ok
    end
    
  end

  private

  def subscribe_params
    params.require(:subscription).permit(:email)
  end
  
end
