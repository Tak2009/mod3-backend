class FxHistoriesController < ApplicationController

    def index
        fx_histories = FxHistory.all
        render json: fx_histories.to_json
    end

end
