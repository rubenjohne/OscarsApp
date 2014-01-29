class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :pictureurl
      t.string :promocode

      t.timestamps
    end
  end
end
