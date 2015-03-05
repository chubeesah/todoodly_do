class ListsController < ApplicationController
 # before_action :set_list, only: :destroy
  before_action :set_user
  before_action :authenticate_user!

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
      format.html { redirect_to :root }
    #  format.js { render :destroy }
    end
  end

  def all
    @lists = List.all
    render :index
  end

  def unfinished
    @lists = List.where(unfinished: true)
    render :index    
  end

  def finished
    @list = List.find(params[:id])
    @list.unfinished = false
    @list.save
    respond_to do |format|
      format.html { redirect_to :root }
    end
  end

  def show_finished
    @lists = List.where(unfinished: false)
    render :index
  end

  def trash
    @lists = List.where(unfinished: false)
    @lists.destroy_all
    redirect_to :root, notice: "Completed tasks successfully trashed!"
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
  
  def list_params
      params.require(:list).permit(:title)
  end
  def set_user
    @user = User.find_by(params[:user_id])
  end
end
