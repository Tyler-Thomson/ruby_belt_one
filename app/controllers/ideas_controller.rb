class IdeasController < ApplicationController
  def index
    @user = current_user

    @ideas = Idea.all
  end

  def create
    idea = Idea.new(idea_params)
    idea.user = current_user
    unless idea.save
      flash[:errors] = idea.errors.full_messages
    end
    return redirect_to :back
  end

  def show
    @idea = Idea.find(params[:id])
    @users = @idea.users
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy if current_user == @idea.user
    redirect_to '/ideas'
  end

  private
    def idea_params
      params.require(:idea).permit(:content).merge(user: current_user)
    end

end
