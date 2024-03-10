class AddRoomsAndSquareMetersToPremises < ActiveRecord::Migration[6.0]
  def change
    add_column :premises, :rooms, :integer
    add_column :premises, :square_meters, :integer
  end
end