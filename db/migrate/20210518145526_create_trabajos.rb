class CreateTrabajos < ActiveRecord::Migration[6.1]
  def change
    create_table :trabajos do |t|
      t.string :descripcion
      t.string :localizacion
      t.float :presupuesto

      t.timestamps
    end
  end
end
