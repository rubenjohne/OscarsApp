class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :dayname

      t.timestamps
    end
  end
end
