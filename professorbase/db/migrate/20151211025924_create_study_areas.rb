class CreateStudyAreas < ActiveRecord::Migration
  def change
    create_table :study_areas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
