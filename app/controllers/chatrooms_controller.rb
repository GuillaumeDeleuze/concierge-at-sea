class ChatroomsController < ApplicationController
  before_action :load_entities

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom_message = Message.new(chatroom: @chatroom)
    @chatroom_messages = @chatroom.messages.includes(:user)
  end
  

  def new
    @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.new

  end

  def create
    @booking = Booking.find(params[:booking_id])
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      flash[:success] = "chatroom #{@chatroom.name} was created successfully"
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :booking_id)
  end

  def load_entities
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.find(params[:id]) if params[:id]
  end
end
