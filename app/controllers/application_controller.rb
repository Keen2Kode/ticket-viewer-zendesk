class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper
    # # so can be applied to other models eg: Customer, if needed
    # before_action :set_json_data
    
    
    # def set_json_data
    #     begin
    #         # using ApplicationHelper to handle requests -> json
    #         @json_data = json_data
    #     rescue StandardError => e
    #         redirect_to response_index_path, notice: e.message
    #     end
    # end
end
