class AddGuardianIdToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :guardian_id, :integer
  end
end
