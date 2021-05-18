class CreateTipoTrabajos < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_trabajos do |t|
      t.string :Tipo

      t.timestamps
    end
  end
end
