class PortHistoriesController < ApplicationController
    
    def index
        port_histories = PortHistory.all
        render json: port_histories.to_json
    end
   
    def create
        port_history = PortHistory.new(port_history_params)
        port_history.save
    end
   
    private

	def port_history_params
		params.require(:port_history).permit!
	end


end
