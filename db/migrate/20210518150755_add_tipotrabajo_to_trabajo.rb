class AddTipotrabajoToTrabajo < ActiveRecord::Migration[6.1]
  def change
    add_column :trabajos, :tipotrabajo, :string
    add_index :trabajos, :tipotrabajo
  end
end
