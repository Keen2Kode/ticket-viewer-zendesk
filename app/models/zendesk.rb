# for ease of configuration, ActiveRecord with a database was skipped
# the models here have no database

# mockable requests
class Zendesk
    
    # example usage of search params
    # json_data page: 3, per_page: 25
    def self.json_data(path, search_params)
        
        resp = api_response(path, search_params)
        JSON.parse resp.body
    end
    
    
    
    # encapsulating the actual response from controllers 
    private
    
    # using the http gem, we can simplify the basic auth process 
    # https://developer.zendesk.com/rest_api/docs/support/introduction#using-basic-authentication
    def self.api_response(path, search_params)
        key = Rails.configuration.api['key']
        url = Rails.configuration.api['url']
        content_type = Rails.configuration.api['content_type']
        resp = HTTP.headers(accept: content_type).auth(key).get(url + path, params: search_params)
        
        unless resp.status.success?
            raise APIRequestError if resp.status.code.between?(400, 499)
            raise APIServerError if resp.status.code >= 500
        end
        
        resp
    end
    
    
    
    
    
    class APIError < StandardError
    end
    
    class APIRequestError < APIError
        def message
          "The received API response is invalid: check your syntax, authentication etc."
        end
    end
    
    class APIServerError < APIError
        def message
          "Seems like our server is unavailable, woops :("
        end
    end
    
end
