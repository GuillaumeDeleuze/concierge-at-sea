class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show, :edit, :update]
    def index
        @activities = Activity.where(yatch: current_user.booking.yatch)
    end

    def show
    end

    def edit
    end

    def update
        @activity.update(activity_params)
        redirect_back(fallback_location: root_path)
        flash[:notice] = "Reserved"
    end

    private

    def set_activity
        @activity = Activity.find(params[:id])
    end

    def activity_params
        params.require(:activity).permit(:reserved, :start_at, :number_of_guest)
    end
end