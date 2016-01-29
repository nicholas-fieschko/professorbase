class AddProfessorToInterests < ActiveRecord::Migration
  def change
    add_reference :interests, :professor, index: true
    add_foreign_key :interests, :professors
    add_reference :interests, :study_area, index: true
    add_foreign_key :interests, :study_areas
  end
end
