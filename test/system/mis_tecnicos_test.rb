require "application_system_test_case"

class MisTecnicosTest < ApplicationSystemTestCase
  setup do
    @mis_tecnico = mis_tecnicos(:one)
  end

  test "visiting the index" do
    visit mis_tecnicos_url
    assert_selector "h1", text: "Mis Tecnicos"
  end

  test "creating a Mis tecnico" do
    visit mis_tecnicos_url
    click_on "New Mis Tecnico"

    fill_in "Apellidos", with: @mis_tecnico.apellidos
    fill_in "Contrasenia", with: @mis_tecnico.contrasenia
    fill_in "Email", with: @mis_tecnico.email
    fill_in "Nombre", with: @mis_tecnico.nombre
    fill_in "Numero trabajos", with: @mis_tecnico.numero_trabajos
    fill_in "Tipo tecnico", with: @mis_tecnico.tipo_tecnico_id
    fill_in "Valoracion", with: @mis_tecnico.valoracion
    click_on "Create Mis tecnico"

    assert_text "Mis tecnico was successfully created"
    click_on "Back"
  end

  test "updating a Mis tecnico" do
    visit mis_tecnicos_url
    click_on "Edit", match: :first

    fill_in "Apellidos", with: @mis_tecnico.apellidos
    fill_in "Contrasenia", with: @mis_tecnico.contrasenia
    fill_in "Email", with: @mis_tecnico.email
    fill_in "Nombre", with: @mis_tecnico.nombre
    fill_in "Numero trabajos", with: @mis_tecnico.numero_trabajos
    fill_in "Tipo tecnico", with: @mis_tecnico.tipo_tecnico_id
    fill_in "Valoracion", with: @mis_tecnico.valoracion
    click_on "Update Mis tecnico"

    assert_text "Mis tecnico was successfully updated"
    click_on "Back"
  end

  test "destroying a Mis tecnico" do
    visit mis_tecnicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mis tecnico was successfully destroyed"
  end
end
