class Elevator < ApplicationRecord
    belongs_to :column
    before_update :check_status
    after_update :status_update
    
    def check_status
        $old_status = self.Status_was
    end

    def status_update
        if self.Status == "Intervention" && self.Status != $old_status
            message = self.id.to_s + ' is defective. Please go check out on the elevator as soon as possible. Have a good day!'
            TwilioTextMessenger.new(message).call
        end
    end
end