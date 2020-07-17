class CreateRide < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :thrill_rating

      t.timestamps
    end
  end
end
