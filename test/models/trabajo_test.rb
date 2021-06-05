require "test_helper"

class TrabajoTest < ActiveSupport::TestCase
   test "Trabajo debe tener ID de cliente - FALLO" do
      assert_raises(ActiveRecord::NotNullViolation) do
        trabajo_fallo = Trabajo.new(
          descripcion: "Enlucir pared", 
          localizacion: "Calle Don Quijote 6", 
          presupuesto: 500, 
          tipotrabajo: "ALBANILERIA",
          Id_cliente: nil)

          trabajo_fallo.save
      end

   end

   test "Trabajo debe tener ID de cliente - CORRECTO" do
    trabajo_correcto = Trabajo.new(descripcion: "Enlucir pared",localizacion: "Calle Don Quijote 6",presupuesto: 500, tipotrabajo: "ALBANILERIA",Id_cliente: 980190962)
    assert trabajo_correcto.save, "El trabajo no se ha guardado pero SÍ tiene una ID de cliente"
   end

   




end
