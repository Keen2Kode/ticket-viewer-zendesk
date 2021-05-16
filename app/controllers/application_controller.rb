class ApplicationController < ActionController::Base
    API = 'api_request'
    GENERAL = 'general'
    protect_from_forgery with: :exception
    include ApplicationHelper
    
    # generally a bad idea, but this is how I interpreted the requirement
    # Tells the user something is wrong if there is a program error.
    rescue_from StandardError, with: :program_error_render
    rescue_from Zendesk::APIError, with: :api_error_render
    
    
    def data(**search_params)
        Zendesk.json_data(request.path, search_params)
    end
    
    def api_error_render(error)
        redirect_to response_path(API), notice: error.message
    end
    
    def program_error_render(error)
        redirect_to response_path(GENERAL), notice: error.message
    end
    
    
    
end
