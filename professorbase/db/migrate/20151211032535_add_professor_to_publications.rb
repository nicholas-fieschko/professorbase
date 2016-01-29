class AddProfessorToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :professor, index: true
    add_foreign_key :publications, :professors
  end
end
