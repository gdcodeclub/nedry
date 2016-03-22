class AddEmailIdToOffenses < ActiveRecord::Migration
  def change
    add_column :offenses, :email_id, :number
  end
end
