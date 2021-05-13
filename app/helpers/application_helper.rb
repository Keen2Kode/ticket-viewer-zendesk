module ApplicationHelper

    # eg: usage of search params
    # json_data page: 3, per_page: 25
    def json_data(**search_params)
        
        resp = api_response(search_params)
        JSON.parse resp.body
    end
    
    
    
    # encapsulating the actual response from controllers 
    private
    
    # using the http gem, we can simplify the basic auth process 
    # https://developer.zendesk.com/rest_api/docs/support/introduction#using-basic-authentication
    def api_response(search_params)
        header = "Basic cmV1YmVuLnJhamVldkBnbWFpbC5jb206dGVzdGluZw=="
        resp = HTTP.auth(header).get("https://slack6386.zendesk.com/api/v2/#{request.path}.json", params: search_params)
        
        raise ActionController::RoutingError, "#{resp.status}" unless resp.status.success?
        resp
    end
end
