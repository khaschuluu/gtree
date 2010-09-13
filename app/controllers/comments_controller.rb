class CommentsController < ApplicationController
  def create
    @tab = Tab.find(params[:tab_id])
    @comment = @tab.comments.build(params[:comment])
    if current_user
      @comment.user_id = current_user.id
    else
      @comment.user_id = 0;
    end
    @comment.save!
    redirect_to @tab
  end
end
