module ApplicationHelper

    def json_data(route)
        
        # using the http gem, we can simplify the basic auth process here: 
        # https://developer.zendesk.com/rest_api/docs/support/introduction#using-basic-authentication
        api_response = HTTP.auth("Basic cmV1YmVuLnJhamVldkBnbWFpbC5jb206dGVzdGluZw==").get("https://slack6386.zendesk.com/api/v2/#{route}.json")
        to_JSON(api_response)
    end
    
    def to_JSON(api_response)
        wrapped_data = JSON.parse api_response.body
        # remove wrapper key "ticket(s): "
        wrapped_data.map{ |k,v| v}.first
    end
end
