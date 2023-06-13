class AddFromToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :from, :string
  end
end
