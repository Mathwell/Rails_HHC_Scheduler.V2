class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :uid, :integer, limit: 8

  end
end
