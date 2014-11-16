class AddParticipantsLimitToTheses < ActiveRecord::Migration
  def change
    add_column :theses, :participants_limit, :integer
  end
end
