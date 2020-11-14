class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :details
      t.decimal :duration
      t.decimal :cost

      t.timestamps
    end
  end
end
