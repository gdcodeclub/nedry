class AddSmsIdToOffenses < ActiveRecord::Migration
  def change
    add_column :offenses, :sms_id, :number
  end
end
