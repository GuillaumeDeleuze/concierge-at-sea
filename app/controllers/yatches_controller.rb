class YatchesController < ApplicationController
    def show
        @yatch = Yatch.find(params[:id]) 
    end
end