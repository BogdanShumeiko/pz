class RenameProductsToPremises < ActiveRecord::Migration[6.0]
  def change
    rename_table :products, :premises
  end
end