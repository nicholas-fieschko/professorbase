class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :info

      t.timestamps null: false
    end
  end
end
