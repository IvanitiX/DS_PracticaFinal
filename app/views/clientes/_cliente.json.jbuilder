json.extract! cliente, :id, :nombre, :apellidos, :domicilio, :correo, :contrasena, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
