class AddUniversitiesAndPublicationsAndInterestsToProfessors < ActiveRecord::Migration
  def change
    add_reference :professors, :university, index: true
    add_foreign_key :professors, :universities
    add_reference :professors, :publications, index: true
    add_foreign_key :professors, :publications
    add_reference :professors, :interests, index: true
    add_foreign_key :professors, :interests
  end
end
