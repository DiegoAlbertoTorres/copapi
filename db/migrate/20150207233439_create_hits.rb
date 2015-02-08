class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :latitude
      t.string :longitud
      t.string :report
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
