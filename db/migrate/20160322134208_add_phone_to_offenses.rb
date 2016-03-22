class AddPhoneToOffenses < ActiveRecord::Migration
  def change
    add_column :offenses, :phone, :string
  end
end
