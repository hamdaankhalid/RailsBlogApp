class Public::CommentsController < Public::BaseController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(
      :commenter => comment_params["commenter"],
      :body => comment_params["body"],
      :status => "private")
    # set it off for moderation in queue
    ModerateCommentJob.perform_later(@comment)
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
