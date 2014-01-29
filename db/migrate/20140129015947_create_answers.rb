class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.datetime :date
      t.string :ipaddress
      t.references :choice, index: true

      t.timestamps
    end
  end
end
