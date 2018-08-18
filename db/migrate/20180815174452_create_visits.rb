class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.belongs_to :patient, foreign_key: true
      t.belongs_to :nurse, foreign_key: true
      t.date :date
      t.timestamps
    end
  end
end
