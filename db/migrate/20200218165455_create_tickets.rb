class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true, null: false
      t.string :comment

      t.timestamps
    end
  end
end
