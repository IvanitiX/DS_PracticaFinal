class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellidos
      t.string :domicilio
      t.string :correo
      t.string :contrasena

      t.timestamps
    end
  end
end
