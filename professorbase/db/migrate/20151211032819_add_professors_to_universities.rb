class AddProfessorsToUniversities < ActiveRecord::Migration
  def change
    add_reference :universities, :professors, index: true
    add_foreign_key :universities, :professors
  end
end
