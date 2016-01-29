class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :title
      t.string :address
      t.string :phone
      t.string :email
      t.string :website
      t.text :bio
      t.string :profile_link

      t.timestamps null: false
    end
  end
end
