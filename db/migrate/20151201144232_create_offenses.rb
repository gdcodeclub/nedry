class CreateOffenses < ActiveRecord::Migration
  def change
    create_table :offenses do |t|
      t.string :ip_address, null: false
      t.timestamps null: false
    end
  end
end
