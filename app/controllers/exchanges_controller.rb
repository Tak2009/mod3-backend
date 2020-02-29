class ExchangesController < ApplicationController

# this is for displaying my data on broweser through my API. rails s and then go to http://localhost:3000/exchanges
    def index
        exchanges = Exchange.all
        render json: exchanges
    end

    def show
        exchange = Exchange.find_by(id: params[:id])
        render json: exchange
    end
    
    # to update database
    def update
        exchange = Exchange.find(params[:id])
        exchange.update(exchange_params)
    end

    private

	def exchange_params
		params.require(:exchange).permit!
	end
end