class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Ticket.create!({ body: @email.body, subject: @email.subject, from: @email.from[:email]})
  end
end
