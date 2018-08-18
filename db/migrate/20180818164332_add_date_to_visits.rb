class AddDateToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :date, :date
  end
end
