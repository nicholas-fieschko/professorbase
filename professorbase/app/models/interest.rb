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

class Interest < ActiveRecord::Base
  belongs_to :professor
  belongs_to :study_area
end
