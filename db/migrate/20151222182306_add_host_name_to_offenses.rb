class AddHostNameToOffenses < ActiveRecord::Migration
  def change
  	add_column :offenses, :host_name, :string
  end
end
