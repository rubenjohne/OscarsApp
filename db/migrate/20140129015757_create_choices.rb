class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :choice
      t.boolean :correct
      t.string :explaination
      t.references :question, index: true

      t.timestamps
    end
  end
end
