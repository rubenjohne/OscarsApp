class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :DayName

      t.timestamps
    end
  end
end
