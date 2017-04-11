class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.date :birth_date
      t.integer :
      t.timestamps null: false
    end
  end
end
