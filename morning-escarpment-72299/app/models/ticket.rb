class Ticket < ActiveRecord::Base
    belongs_to :user
    before_save :default_values
    
    def default_values
    self.status = 'Aberto' if self.status.nil?
    end
    
    default_scope -> { order(created_at: :desc) }
    
    validates :body, presence: true, allow_blank: true
end
