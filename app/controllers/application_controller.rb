class ApplicationController < ActionController::Base
    API = 'api_request'
    GENERAL = 'general'
    protect_from_forgery with: :exception
    include ApplicationHelper
    
    rescue_from StandardError, with: :program_error_render
    rescue_from ActionController::RoutingError, with: :api_error_render
    
    
    def api_error_render(error)
        redirect_to response_path(API), notice: error.message
    end
    
    def program_error_render(error)
        redirect_to response_path(GENERAL), notice: error.message
    end
end
