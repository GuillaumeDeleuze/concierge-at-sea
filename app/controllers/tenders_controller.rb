class TendersController < ApplicationController
    before_action :set_tender, only: [:show, :edit, :update]

    def show
    end

    def edit
    end

    def update
        @tender.update(tender_params)
        if @tender.called == 'not_called'
            flash[:notice] = "Cancelled"
            redirect_back(fallback_location: users_path)
        else
            flash[:notice] = "Reserved"
            redirect_back(fallback_location: users_path)
        end
    end

    private

    def set_tender
        @tender = Tender.find(params[:id]) 
    end

    def tender_params
        params.require(:tender).permit(:called, :time)
    end
end