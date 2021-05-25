class CreateEstadoPropuesta < ActiveRecord::Migration[6.1]
  def change
    create_table :estado_propuesta do |t|
      t.string :estado

      t.timestamps
    end
    add_index :estado_propuesta, :estado, unique: true
  end
end
