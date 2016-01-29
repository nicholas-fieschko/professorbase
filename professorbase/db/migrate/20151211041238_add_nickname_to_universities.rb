class AddNicknameToUniversities < ActiveRecord::Migration
  def change
    add_column :universities, :nickname, :string
  end
end
