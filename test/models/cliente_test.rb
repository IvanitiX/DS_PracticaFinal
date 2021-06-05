require "test_helper"

class ClienteTest < ActiveSupport::TestCase
   test "Cliente debe tener email" do
     assert_raises(ActiveRecord::NotNullViolation) do
       cliente = Cliente.new(
         nombre: "Manolo",
         apellidos: "Lama",
         domicilio: "Calle Santiago Bernabeu 23",
         contrasena: "halamadrid"
       )

       cliente.save
     end
   end


   test "Cliente debe tener contrasenya" do
    assert_raises(ActiveRecord::NotNullViolation) do
      cliente = Cliente.new(
        nombre: "Manolo",
        apellidos: "Lama",
        domicilio: "Calle Santiago Bernabeu 23",
        correo: "manololama@cope.es"
      )

      cliente.save
    end
  end

  test "No se puede meter datos con tipos incorrectos" do
      cliente = Cliente.new(
          nombre: 98.21,
          apellidos: 21.43,
          domicilio: 823947,
          correo: 45621,
          contrasena: 21.34 
        )

      assert_not cliente.save, "[!] Están metiendo valores con tipos incorrectos y entran a la BD sin problemas"
  end

end
