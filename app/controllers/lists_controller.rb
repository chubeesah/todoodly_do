class ListsController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_filter :authenticate_user!
  

  def create
    @list = List.create(list_params)
    respond_to do |format|
      format.html { redirect_to :root }
      format.js { render :create }
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to :index }
      format.js { render :destroy }
    end
  end

  private

  def list_params
      params.require(:list).permit(:title)
  end
  def set_user
    @user = User.find_by(params[:user_id])
  end
end
