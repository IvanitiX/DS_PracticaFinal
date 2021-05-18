require "application_system_test_case"

class TipoTrabajosTest < ApplicationSystemTestCase
  setup do
    @tipo_trabajo = tipo_trabajos(:one)
  end

  test "visiting the index" do
    visit tipo_trabajos_url
    assert_selector "h1", text: "Tipo Trabajos"
  end

  test "creating a Tipo trabajo" do
    visit tipo_trabajos_url
    click_on "New Tipo Trabajo"

    fill_in "Tipo", with: @tipo_trabajo.Tipo
    click_on "Create Tipo trabajo"

    assert_text "Tipo trabajo was successfully created"
    click_on "Back"
  end

  test "updating a Tipo trabajo" do
    visit tipo_trabajos_url
    click_on "Edit", match: :first

    fill_in "Tipo", with: @tipo_trabajo.Tipo
    click_on "Update Tipo trabajo"

    assert_text "Tipo trabajo was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo trabajo" do
    visit tipo_trabajos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo trabajo was successfully destroyed"
  end
end
