class ResponseController < ApplicationController
  
  def show
    @response_type = params[:id]
  end
end
