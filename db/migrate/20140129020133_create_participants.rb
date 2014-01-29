class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :email
      t.boolean :subscribed

      t.timestamps
    end
  end
end
