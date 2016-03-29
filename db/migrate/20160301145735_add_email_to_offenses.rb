class AddEmailToOffenses < ActiveRecord::Migration
  def change
    add_column :offenses, :email, :string
  end
end
