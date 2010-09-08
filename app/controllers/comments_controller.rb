class CommentsController < ApplicationController
  def create
    if current_user
      @tab = Tab.find(params[:tab_id])
      @comment = @tab.comments.build(params[:comment])
      @comment.user_id = current_user.id
      @comment.save!

      redirect_to @tab
    else
      flash[:notice] = 'Premission denied! You can do this after logged in'
      redirect_to root_url
    end
  end
end
