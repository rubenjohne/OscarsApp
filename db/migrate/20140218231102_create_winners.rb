class CreateWinners < ActiveRecord::Migration
  def change
    
    create_table :winners do |t|
      t.integer :participant_id
      t.integer :price_id

      t.timestamps
    end
  end
end
