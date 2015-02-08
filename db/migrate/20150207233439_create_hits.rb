class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :name
      t.string :last
      t.string :phone
      t.string :latitude
      t.string :longitud
      t.string :report
      t.string :contact_name
      t.string :contact_last
      t.string :contact_phone
      t.string :contact_email
      t.integer:age

      t.integer :user_id

      t.timestamps null: false
    end
  end
end
