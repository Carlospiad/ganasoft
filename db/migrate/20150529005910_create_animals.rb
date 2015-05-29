class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :brand_identification
      t.string :breed
      t.boolean :branded
      t.date :date_of_birth
      t.date :date_of_purchase
      t.string :gender
      t.string :country_of_birth
      t.string :status
      t.references :mother_id, index: true
      t.references :father_id, index: true


      t.timestamps null: false
    end
  end
end
