class BrokerController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :broker_sign_in_page, :broker_home_page, :broker_booking_page]


  def broker_home_page
    @yatchs = Yatch.all
    @bookings = Booking.all       

  end 

  def broker_booking_page
  end

  def broker_sign_in_page
  end
end