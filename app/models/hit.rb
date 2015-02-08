# == Schema Information
#
# Table name: hits
#
#  id            :integer          not null, primary key
#  name          :string
#  last          :string
#  phone         :string
#  latitude      :string
#  longitud      :string
#  report        :string
#  contact_name  :string
#  contact_last  :string
#  contact_phone :string
#  contact_email :string
#  age           :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Hit < ActiveRecord::Base
  belongs_to :user
  validates :phone, :longitud, :latitude, :report, presence: true

end
