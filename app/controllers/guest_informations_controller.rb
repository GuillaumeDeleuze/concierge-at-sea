class GuestInformationsController < ApplicationController
    before_action :set_guest_information, only: [:show, :edit, :update]


    def show
    end

    def new
        @guest = User.find(params[:user_id])
        @guest_information = GuestInformation.new    
    end
  
    def create      
        @guest_information = GuestInformation.new(guest_information_params)
        @guest = User.find(params[:user_id])

        if @guest_information.save  
            redirect_to new_user_guest_preference_path(current_user)
        end
    end
    
    def edit
    end

    def update
        @guest_information.update(guest_information_params)
        redirect_to root_path
        flash[:notice] = "Saved"
    end

    private

    def set_guest_information
        @guest_information = GuestInformation.find(params[:id]) 
    end

    def guest_information_params
        params.require(:guest_information).permit(
            :birth_date, 
            :passport_number, 
            :nationality, 
            :mobile_number, 
            :charter_yatch, 
            :arrival_date, 
            :departure_date, 
            :number_of_guests, 
            :flight_number, 
            :collecting_at_airport, 
            :in_hotel, 
            :hotel_name, 
            :completed,
            :visible,
            :user_id
        )
    end
end