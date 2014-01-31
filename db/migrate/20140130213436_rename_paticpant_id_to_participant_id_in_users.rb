class RenamePaticpantIdToParticipantIdInUsers < ActiveRecord::Migration
  def change
    rename_column :answers, :particpant_id, :participant_id
  end
end
