class ExchangesController < ApplicationController

# getExchnages
    def index
        exchanges = Exchange.all
        render json: exchanges
    end
end
