# == Schema Information
#
# Table name: publications
#
#  id           :integer          not null, primary key
#  info         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  professor_id :integer
#

require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
