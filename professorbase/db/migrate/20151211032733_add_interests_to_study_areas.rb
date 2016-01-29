class AddInterestsToStudyAreas < ActiveRecord::Migration
  def change
    add_reference :study_areas, :interests, index: true
    add_foreign_key :study_areas, :interests
  end
end
