class PortfoliosController < ApplicationController

     # this is for displaying my data on broweser through my API. rails s and then go to http://localhost:3000/portfolios
     def index
        portfolios = Portfolio.all
        render json: portfolios
    end

    def show
        render json: portfolio
    end
end
