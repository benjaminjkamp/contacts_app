class AddLongitudeToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :longitude, :float
  end
end
