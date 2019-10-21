class ExchangesController < ApplicationController

# this is for displaying my data on broweser through my API. rails s and then go to http://localhost:3000/exchanges
    def index
        exchanges = Exchange.all
        render json: exchanges
    end
end
