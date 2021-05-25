class CreatePropuestas < ActiveRecord::Migration[6.1]
  def change
    create_table :propuestas do |t|
      t.string :id_tecnico
      t.string :id_trabajo

      t.timestamps
    end
  end
end
