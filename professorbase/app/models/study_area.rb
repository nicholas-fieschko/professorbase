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

class StudyArea < ActiveRecord::Base
  has_many :interests
end
