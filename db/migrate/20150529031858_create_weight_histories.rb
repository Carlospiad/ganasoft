class CreateWeightHistories < ActiveRecord::Migration
  def change
    create_table :weight_histories do |t|
      t.decimal :weight, :precision => 6, :scale => 2
      t.references :animal, index: true, foreign_key: true
      t.date :date_of_weight

      t.timestamps null: false
    end
  end
end
