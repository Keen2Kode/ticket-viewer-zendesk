# for ease of configuration, ActiveRecord with a database was skipped
# the models here have no database
class Ticket
    attr_reader :id, :subject, :description, :created_at, :requester_id, :status
    
    def initialize(data)
        @id = data['id']
        @subject = data['subject']
        @description = data['description']
        @created_at  = data['created_at']
        @requester_id = data['requester_id'] 
        @status = data['status'] 
    end
    
end
