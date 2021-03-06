class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:destroy]
  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to :action => :index
  end

  def destroy
    @user = User.find(params[:id])
    if current_user && (current_user.admin? || current_user == @user)
      @user.destroy
      redirect_to users_path, notice: "User deleted."
    else
      flash[:alert] = "You are only allowed to delete your own account!"
      redirect_to :root
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
