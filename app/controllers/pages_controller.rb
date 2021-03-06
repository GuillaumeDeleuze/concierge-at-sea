class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :broker_sign_in_page, :broker_home_page, :broker_booking_page]

  def home
  end

  def dashboard
    @captain_message = current_user.booking.captain_message 
    @booking = current_user.booking
    @activities = Activity.where(yatch: current_user.booking.yatch).where.not(:reserved => 'not_reserved')
    @beverages = Beverage.where(booking: current_user.booking).where("quantity > ?", 1)   
    @tenders = Tender.where(yatch: current_user.booking.yatch).where.not(:called => 'not_called')
    @activities_pending = Activity.where(yatch: current_user.booking.yatch).where(:reserved => 'pending').count
    @beverages_pending = Beverage.where(booking: current_user.booking).where("quantity > ?", 0).count
    @tenders_pending = Tender.where(yatch: current_user.booking.yatch).where(:called  => 'pending').count
    @chatroom = current_user.booking.chatrooms.where(:name => "General").first
    @total_orders = (@activities_pending + @beverages_pending + @tenders_pending)
    @last_message = @chatroom.messages.last



    if request.location.latitude == nil 
      response = RestClient.get "https://api.darksky.net/forecast/#{ENV['WEATHER_API_KEY']}/42.3601,-71.0589?units=si"
    else
      response = RestClient.get "https://api.darksky.net/forecast/#{ENV['WEATHER_API_KEY']}/#{request.location.latitude},#{request.location.longitude}?units=si"
    end
    @currently = eval(response.body)[:currently]
    @daily = eval(response.body)[:daily][:data].first
    weathers = {
      "partly cloudy" => "fas fa-cloud-showers-heavy",
      "sun" => "far fa-sun",
      "wind" => "fas fa-wind",
      "storm" => "fas fa-poo-storm",
      "rain" => "fas fa-cloud-rain",
      "snow" => "far fa-snowflake",
      "cloud" => "fas fa-cloud"
    }
    @icon = "fab fa-skyatlas"
    weathers.each do |name, icon|
      regex = Regexp.new(name)
      if regex.match(@currently[:summary].downcase)
        @icon = icon
        break
      end
    end
  end
  
  def agenda
    @activities = Activity.where(yatch: current_user.booking.yatch).where.not(:reserved => 'not_reserved')
    @beverages = Beverage.where(booking: current_user.booking).where("quantity > ?", 0)   
    @tenders = Tender.where(yatch: current_user.booking.yatch).where.not(:called => 'not_called')
  end

  def order
    @activities = Activity.where(yatch: current_user.booking.yatch).where(:reserved => 'pending')
    @beverages = Beverage.where(booking: current_user.booking).where("quantity > ?", 0)   
    @tenders = Tender.where(yatch: current_user.booking.yatch).where(:called => 'pending')
  end

  def map
  end
  
  def profile
    @guest_information = GuestInformation.where(user: current_user)
    @guest_preference = GuestPreference.where(user: current_user)
  end

  def broker_home_page
    @yatchs = Yatch.all
    @bookings = Booking.all       

  end 

  def broker_booking_page
  end

  def broker_sign_in_page
  end

end
