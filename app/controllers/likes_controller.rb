class LikesController < ApplicationController
  def create
    idea = Idea.find(like_params[:idea_id])

    #@liked_ideas = Idea.find(id: params[:id], user: current_user)
        #Also tried with these two lines...couldn't get it to work then either
    #if @liked_ideas.users.include? current_user

    if idea.users.include? current_user
      flash[:errors] = ["You can only like something once"]
      p 'if'
    else
      Like.create(like_params)
      p 'else'
    end
    return redirect_to :back
  end

  private
    def like_params
      params.require(:like).permit(:idea_id).merge(user: current_user)
    end
end
