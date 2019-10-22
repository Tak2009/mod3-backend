class PortfoliosController < ApplicationController

     # this is for displaying my data on broweser through my API. rails s and then go to http://localhost:3000/portfolios
    def index
        portfolios = Portfolio.all
        render json: portfolios.to_json(include: [:exchange])
    end
    
    # get/portfolios/1
    def show
        portfolio = Portfolio.find_by(id: params[:id])
        render json: portfolio.to_json(include: [:exchange])
    end

    # def new
    #    portfolio = Portfolio.new
    # end
    
    # post/portfolios
    def create
        portfolio = Portfolio.new(portfolio_params)
        portfolio.save
    end

    # def edit
	# 	portfolio = Portfolio.find(params[:id])
	# end
    
    # patch/portfolios/1
	def update
        portfolio = Portfolio.find(params[:id])
        portfolio.update(portfolio_params)
    end
    
    # delete/portfolios/1
    def destroy
        Portfolio.destroy(params[:id])
    end

	private

	def portfolio_params
		params.require(:portfolio).permit!
	end

end
