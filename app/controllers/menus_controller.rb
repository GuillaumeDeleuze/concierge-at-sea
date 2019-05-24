class MenusController < ApplicationController
    def index
        @menus = Menu.where(booking: current_user.booking)
    end
end