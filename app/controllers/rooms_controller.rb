class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
  end

  def new
    @room = current_user.rooms.new
  end

  def show
    @room = set_room
    @messages = @room.messages.includes(:user)
    @user = current_user
  end

  def create
    @room = current_user.rooms.new room_params
    @user = current_user
    if @room.save
      flash[:success] = 'Room is created'
      redirect_to rooms_path
    else
      flash.now[:danger] = 'Something wrong'
      render :new
    end
  end

  def destroy
    flash[:error] = 'No Room' unless @room&.destroy
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find_by(id: params[:id])
  end

  def room_params
    params.require(:room).permit :name
  end
end
