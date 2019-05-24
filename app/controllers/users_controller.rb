class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @guest_users = current_user.booking.user.where(:guest => true)
    end
  
    def show 
    end
  
    def new       
        @user = User.new    
    end
  
    def create      
        @user = User.new(user_params)
        @user.save  

        #redirect_to 
    end
  
    def edit          
    end
  
    def update        
        @user.update(user_params)

        #redirect_to
    end
  
    def destroy
        @user.destroy

        #redirect_to
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :main, :name)
    end
end