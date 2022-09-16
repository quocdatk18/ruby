class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(list_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
  end

  private

  def list_params
    params.require(:user).permit(:name, :email, :password, :address, :avatar, :phone)
  end
end
