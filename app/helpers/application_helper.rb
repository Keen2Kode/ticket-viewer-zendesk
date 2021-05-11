module ApplicationHelper

    def json_data(route)
        
        resp = api_response(route)
        wrapped_data = JSON.parse resp.body
        # remove wrapper key "ticket(s): "
        wrapped_data.map{ |k,v| v}.first
    end
    
    
    
    # encapsulating the actual response from controllers 
    private
    
    # using the http gem, we can simplify the basic auth process 
    # https://developer.zendesk.com/rest_api/docs/support/introduction#using-basic-authentication
    def api_response(route)
        encrypted_name_password = "cmV1YmVuLnJhamVldkBnbWFpbC5jb206dGVzdGluZw=="
        domain = "slack6386"
        resp = HTTP.auth("Basic #{encrypted_name_password}").get("https://#{domain}.zendesk.com/api/v2/#{route}.json")
        
        raise "#{resp.status}" unless resp.status.success?
        resp
    end
end
