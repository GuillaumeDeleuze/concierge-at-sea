class MessagesController < ApplicationController
    before_action :load_entities
  
    def create
      @message = Message.create user: current_user,
                                         chatroom: @chatroom,
                                         content: params.dig(:message, :content)
      if @message.save 
        redirect_to chatroom_path(@chatroom)
      end
    end
  
    protected
  
    def load_entities
      @chatroom = Chatroom.find params.dig(:message, :chatroom_id)
    end
  end
  