class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :body
      t.string :status
      t.integer :priority
      t.text :note

      t.timestamps null: false
    end
  end
end
