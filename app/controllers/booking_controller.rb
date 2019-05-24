class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

    def index  
        @bookings = Booking.all       
    end
  
    def show 
    end
  
    def new       
        @booking = Booking.new    
    end
  
    def create      
        @booking = Booking.new(booking_params)
        @booking.save  

        #redirect_to 
    end
  
    def edit          
    end
  
    def update        
        @booking.update(booking_params)
        redirect_to dashboard_path
    end
  
    def destroy
        @booking.destroy

        #redirect_to
    end

    private

    def set_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:yatch_id, :user_id, :start_at, :end_at, :rating, :captain_message)
    end

end