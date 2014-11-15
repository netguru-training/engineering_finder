class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text
      t.references :user, index: true
      t.references :thesis, index: true

      t.timestamps
    end
  end
end
