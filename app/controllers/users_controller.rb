class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    p @user
    if @user.valid?
        @user.save
        flash[:notice] = ["Registered Successfully"]
        session[:user_id] = @user.id
        return redirect_to '/ideas'
    end

    flash[:errors] = @user.errors.full_messages

    return redirect_to ''
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
    end

    def authorization
      return redirect_to '/' unless session[:user_id].to_s == params[:id]
    end
end
