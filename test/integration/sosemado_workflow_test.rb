require "test_helper"

class SosemadoWorkflowTest < ActionDispatch::IntegrationTest
  test "Página de inicio" do
    get "/"
    assert_select "h1", "Bienvenido a SOSEMADO"
  end

  test "Registro de cliente" do
    get "/clientes/new"
    assert_response :success
   
    assert_raises(TypeError) do
      post "/clientes", params: {
        cliente:{
          nombre: "Paquito",
          apellidos: "El pruebas",
          domicilio: "Calle Muro 69"
        }
      }
    end

    post "/clientes", params: {
        cliente:{
          nombre: "Paquito",
          apellidos: "El pruebas",
          domicilio: "Calle Muro 69",
          correo: "paquito@test.es",
          contrasena: "test"
        }
      }

    assert_response :redirect
    follow_redirect!

    assert_select "h1", "Perfil"
  end

  test "Inicio de sesión de cliente" do
    get "/login"
    assert_select "h1", "Iniciar sesión"
    post "/login", params:{
      session:{
        email: "santi@sosemado.br",
        password: "erroneo"
      }
    }
    assert_response :success
    assert_select "h1", "Iniciar sesión"

    post "/login", params:{
      session:{
        email: "santi@sosemado.br",
        password: "1234"
      }
    }

    assert_response :redirect
    assert_redirected_to "/"
    follow_redirect!

    assert_select "h1", "Bienvenid@, Santiago"


  end

  test "Crear un trabajo" do
    get "/trabajos/new"
    assert_redirected_to "/"

    post "/login", params:{
      session:{
        email: "santi@sosemado.br",
        password: "1234"
      }
    }

    assert_response :redirect
    assert_redirected_to "/"
    follow_redirect!

    get "/trabajos/new"
    assert_select "h1", "Describa su problema :)"

    propuestas_antes = Propuestas.count
    antes = Trabajo.count

    assert_raises(ActiveRecord::StatementInvalid) do
      post "/trabajos", params: {
        trabajo:{
          descripcion: "El mando de la ducha se ha partido",
          localizacion: "Calle Falsa 123",
          tipotrabajo: "FONTANERIA",
          presupuesto: "ERROR"
        }
      }
    end

    assert_raises(ActiveRecord::NotNullViolation) do
      post "/trabajos", params: {
        trabajo:{
          descripcion: nil,
          localizacion: "Calle Falsa 123",
          tipotrabajo: "FONTANERIA",
          presupuesto: 210.23
        }
      }
    end

    despues = Trabajo.count

    if antes == despues
      assert true
    else
      trabajo = Trabajo.find_by(descripcion: "El mando de la ducha se ha partido")
      assert_not trabajo[:presupuesto] == "ERROR"
    end

    post "/trabajos", params: {
        trabajo:{
          descripcion: "El mando de la ducha se ha partido",
          localizacion: "Calle Falsa 123",
          tipotrabajo: "FONTANERIA",
          presupuesto: 210.23
        }
      }

      assert_response :redirect
      follow_redirect!
  
      assert_select "h1", "Trabajo"

      propuestas_despues = Propuestas.count

      assert_equal propuestas_antes+1, propuestas_despues

  end
  
end
