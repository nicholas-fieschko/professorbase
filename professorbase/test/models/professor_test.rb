# == Schema Information
#
# Table name: professors
#
#  id              :integer          not null, primary key
#  title           :string
#  address         :string
#  phone           :string
#  email           :string
#  website         :string
#  bio             :text
#  profile_link    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  university_id   :integer
#  publications_id :integer
#  interests_id    :integer
#  name            :string
#

require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
