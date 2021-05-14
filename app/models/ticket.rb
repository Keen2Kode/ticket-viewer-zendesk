# for ease of configuration, ActiveRecord with a database was skipped
# the models here have no database
class Ticket
    attr_reader :id, :subject, :description, :created_at, :requester_id, :status
    
    def initialize(data)
        @id = data['id']
        @subject = data['subject']
        @description = data['description']
        date = DateTime.parse(data['created_at'])
        @created_at  = date.to_date if date
        @requester_id = data['requester_id'] 
        @status = data['status'] 
    end
    
    # separate model logic from controller
    def self.array(data_array)
        data_array.map {|data| Ticket.new(data) }.compact
    end
    
end
