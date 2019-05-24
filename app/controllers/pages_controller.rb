class PagesController < ApplicationController
  
  def home
  end
  
  def dashboard
    @captain_message = current_user.booking.captain_message 
    @booking = current_user.booking
    @activities = Activity.where(yatch: current_user.booking.yatch).where.not(:reserved => 'not_reserved')
    @beverages = Beverage.where(booking: current_user.booking).where("quantity > ?", 1)   
    @tenders = Tender.where(yatch: current_user.booking.yatch).where.not(:called => 'not_called')
    @activities_pending = Activity.where(yatch: current_user.booking.yatch).where(:reserved => 'pending').count
    @beverages_pending = Beverage.where(booking: current_user.booking).where("quantity > ?", 1).count
    @tenders_pending = Tender.where(yatch: current_user.booking.yatch).where(:called  => 'pending').count
    


    response = RestClient.get "https://api.darksky.net/forecast/#{ENV['WEATHER_API_KEY']}/42.3601,-71.0589"
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
    @beverages = Beverage.where(booking: current_user.booking).where("quantity > ?", 1)   
    @tenders = Tender.where(yatch: current_user.booking.yatch).where.not(:called => 'not_called')
  end

  def order
    @activities = Activity.where(yatch: current_user.booking.yatch).where(:reserved => 'pending')
    @beverages = Beverage.where(booking: current_user.booking).where("quantity > ?", 1)   
    @tenders = Tender.where(yatch: current_user.booking.yatch).where(:called => 'pending')
  end

  def map
  end
  
  def profile
    @guest_information = GuestInformation.where(user: current_user)
    @guest_preference = GuestPreference.where(user: current_user)
  end
end
