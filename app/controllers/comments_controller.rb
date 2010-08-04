class CommentsController < ApplicationController
  def create
    @tab = Tab.find(params[:tab_id])
    @comment = @tab.comments.create!(params[:comment])

    redirect_to @tab
  end
end
