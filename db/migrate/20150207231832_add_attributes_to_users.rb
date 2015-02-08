class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, default: "citizen"
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :birthdate, :date
    add_column :users, :gender, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :address_zip_code, :string
    add_column :users, :address_state, :string
    add_column :users, :address_country, :state
    add_column :users, :emergency_contact_name, :string
    add_column :users, :emergency_contact_phone, :string
    add_column :users, :emergency_contact_alternate_phone, :string
    add_column :users, :emergency_contact_relation, :string
    add_column :users, :warranty_number, :string
  end
end
