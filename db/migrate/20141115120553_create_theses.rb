class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.string :title
      t.text :description
      t.references :user, index: true
      t.string :university

      t.timestamps
    end
  end
end
