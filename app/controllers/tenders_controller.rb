class TendersController < ApplicationController
    before_action :set_tender, only: [:show, :edit, :update]

    def show
    end

    def edit
    end

    def update
        @tender.update(tender_params)
        redirect_back(fallback_location: users_path)
        flash[:notice] = "Reserved"
    end

    private

    def set_tender
        @tender = Tender.find(params[:id]) 
    end

    def tender_params
        params.require(:tender).permit(:called, :time)
    end
end