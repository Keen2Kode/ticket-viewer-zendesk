ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # no database so fixtures can't work
  # fixtures :all
  
  
  
  
  # similar to the format of zendesk json
  def api_tickets_hash(amt = 24)
    
    array = (1..amt).map {|id| ticket_hash(id)}
    
    {'tickets' => array}
  end
  
  def api_ticket_hash
    {'ticket' => ticket_hash(1) }
  end
  
  
  
  
  
  
  private
  
  def ticket_hash(id)
    {
      'id' => id,
      'subject' => "Subject name",
      'description' => "Hello this is a description",
      'created_at' => "2012-04-04T09:14:57Z",
      'requester_id' => 1234,
      'status' => "open"
    }
  end
  # Add more helper methods to be used by all tests here...
end
