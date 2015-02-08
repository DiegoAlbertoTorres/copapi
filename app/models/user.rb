# == Schema Information
#
# Table name: users
#
#  id                                :integer          not null, primary key
#  email                             :string           default(""), not null
#  encrypted_password                :string           default(""), not null
#  reset_password_token              :string
#  reset_password_sent_at            :datetime
#  remember_created_at               :datetime
#  sign_in_count                     :integer          default("0"), not null
#  current_sign_in_at                :datetime
#  last_sign_in_at                   :datetime
#  current_sign_in_ip                :string
#  last_sign_in_ip                   :string
#  created_at                        :datetime
#  updated_at                        :datetime
#  type                              :string           default("citizen")
#  name                              :string
#  phone                             :string
#  birthdate                         :date
#  gender                            :string
#  address_1                         :string
#  address_2                         :string
#  address_zip_code                  :string
#  address_state                     :string
#  address_country                   :state
#  emergency_contact_name            :string
#  emergency_contact_phone           :string
#  emergency_contact_alternate_phone :string
#  emergency_contact_relation        :string
#  warranty_number                   :string
#

# type can be:
#    - admin
#    - citizen
#    - policeman

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :type, :birthdate, :gender, :address_1, :address_zip_code, :address_state, :address_country, :emergency_contact_name, :emergency_contact_phone, :emergency_contact_relation, presence: true

  has_many :hits

  def admin?
    self.type == "admin"
  end

  def citizen?
    self.type == "citizen"
  end

  def policeman?
    self.type == "policeman"
  end
end
