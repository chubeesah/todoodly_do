class ListsController < ApplicationController
  before_action :set_user

  def create
    @list = List.create(:title => params[:title)
    respond_to do |format|
      format.html { redirect_to [@user, @post] }
      format.js { render :create }
    end
  end

  def destroy
    @list = List.find(params[:id])
    
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
