class ChangeDependencyLogicThesesCategory < ActiveRecord::Migration
  def change
      add_column :theses, :category_id, :integer, index: true
      remove_column :categories, :thesis_id, :integer
  end
end
