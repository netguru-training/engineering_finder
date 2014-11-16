class AddingRelationUserBelongsToThesis < ActiveRecord::Migration
  def change
    add_column :users, :chosen_thesis_id, :integer, index: true
  end
end
