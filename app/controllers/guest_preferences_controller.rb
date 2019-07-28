class GuestPreferencesController < ApplicationController
    before_action :set_guest_preference, only: [:show, :edit, :update]

    def show
    end

    def new
        @guest = User.find(params[:user_id])
        @guest_preference = GuestPreference.new    
    end
  
    def create      
        @guest_preference = GuestPreference.new(guest_preference_params)
        @guest = User.find(params[:user_id])
        if @guest_preference.save  
            redirect_to dashboard_path
        end

    end
    def edit
    end

    def update
        @guest_preference.update(guest_preference_params)
        redirect_to dashboard_path
        flash[:notice] = "Saved"
    end

    private

    def set_guest_preference
        @guest_preference = GuestPreference.find(params[:id]) 
    end

    def guest_preference_params
        params.require(:guest_preference).permit(
            :user_id,
            :shoe_size, 
            :height, 
            :weight, 
            :character, 
            :specific_request, 
            :interest, 
            :medical_details, 
            :food_preference, 
            :beverage_preference, 
            :alcohol_preference, 
            :flower, 
            :newspaper, 
            :wine,
            :newspaper_type ,
            :allergy,
            :dislike
        )
    end
end

