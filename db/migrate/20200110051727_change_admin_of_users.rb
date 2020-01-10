class ChangeAdminOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :admin, :boolean, default: false, null: false
  end

  def down
    change_column :users, :admin, :boolean
  end
end
