class CreateAmusementPark < ActiveRecord::Migration[5.1]
  def change
    create_table :amusement_parks do |t|
      t.string :name
      t.integer :admission_price

      t.timestamps
    end
  end
end
