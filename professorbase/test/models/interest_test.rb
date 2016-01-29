# == Schema Information
#
# Table name: interests
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  professor_id  :integer
#  study_area_id :integer
#

require 'test_helper'

class InterestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
