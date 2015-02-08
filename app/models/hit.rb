# == Schema Information
#
# Table name: hits
#
#  id         :integer          not null, primary key
#  latitude   :string
#  longitud   :string
#  report     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hit < ActiveRecord::Base
  belongs_to :user
  validates :longitud, :latitude, :report, presence: true
end
