class FxhistoriesController < ApplicationController
    def index
        fxhistories = Fxhistory.all
        render json: fxhistories
    end
end
