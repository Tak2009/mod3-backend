class FxhistoriesController < ApplicationController

　　# this is for displaying my data on broweser through my API. rails s and then go to http://localhost:3000/fxhistories
    def index
        fxhistories = Fxhistory.all
        render json: fxhistories
    end
end
