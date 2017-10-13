class RanameCloumnTypeToPropertytype < ActiveRecord::Migration[5.0]
  def change
    rename_column :properties, :type, :propertytype
  end
end
