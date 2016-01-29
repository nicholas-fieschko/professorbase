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

class Publication < ActiveRecord::Base
  belongs_to :professor
end
