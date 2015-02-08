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

require 'test_helper'

class HitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
