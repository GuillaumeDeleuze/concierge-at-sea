class BeveragesController < ApplicationController
    before_action :set_beverage, only: [:edit, :update]

    def index  
        @beverages = Beverage.where(booking: current_user.booking)       
    end

    def tea_index
        @teas = Beverage.where(booking: current_user.booking).where(:beverage_type => 0)
    end
    
    def alcohol_index
        @alcohols = Beverage.where(booking: current_user.booking).where(:beverage_type => 1)
    end

    def soft_drink_index
        @soft_drinks = Beverage.where(booking: current_user.booking).where(:beverage_type => 2)
    end

    def coffee_index
        @coffees = Beverage.where(booking: current_user.booking).where(:beverage_type => 3)
    end

    def cocktail_index
        @cocktails = Beverage.where(booking: current_user.booking).where(:beverage_type => 4)
    end

    def all_day_dining_index
        @all_day_dinings = Beverage.where(booking: current_user.booking).where(:beverage_type => 5)
    end

    def edit
    end

    def update
        @beverage.update(beverage_params)
        if @beverage.quantity > @old_beverage.quantity
            flash[:notice] = "Ordered"
            redirect_back(fallback_location: users_path)
        else
            flash[:notice] = "Removed"
            redirect_back(fallback_location: users_path)
        end
    end

    private

    def set_beverage
        @beverage = Beverage.find(params[:id])
        @old_beverage = Beverage.find(params[:id])
    end

    def beverage_params
        params.require(:beverage).permit(:quantity)
    end
end