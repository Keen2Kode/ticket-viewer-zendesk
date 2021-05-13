class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper
    
    rescue_from StandardError, with: :program_error_render
    rescue_from ActionController::RoutingError, with: :api_error_render
    # so can be applied to other models eg: Customer, if needed
    
    
    def api_error_render(error)
        redirect_to response_path('api_request'), notice: error.message
    end
    
    def program_error_render(error)
        redirect_to response_path('general'), notice: error.message
    end
end
