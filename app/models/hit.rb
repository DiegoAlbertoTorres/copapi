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
  include ActiveModel::Serializers::JSON
  belongs_to :user
  validates :longitud, :latitude, :report, presence: true
  

  def attributes=(hash)
  	hash.each do |key, value|
	  send("#{key}=",value)
	end
  end
  def attributes
    instance_values
  end
end
