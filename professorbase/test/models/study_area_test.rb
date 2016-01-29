# == Schema Information
#
# Table name: study_areas
#
#  id           :integer          not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  interests_id :integer
#

require 'test_helper'

class StudyAreaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
