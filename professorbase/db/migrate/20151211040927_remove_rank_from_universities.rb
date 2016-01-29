class RemoveRankFromUniversities < ActiveRecord::Migration
  def change
    remove_column :universities, :rank
  end
end
