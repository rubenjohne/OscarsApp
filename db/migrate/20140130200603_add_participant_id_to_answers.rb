class AddParticipantIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :particpant_id, :int
  end
end
