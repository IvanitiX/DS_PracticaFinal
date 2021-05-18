require "application_system_test_case"

class TrabajosTest < ApplicationSystemTestCase
  setup do
    @trabajo = trabajos(:one)
  end

  test "visiting the index" do
    visit trabajos_url
    assert_selector "h1", text: "Trabajos"
  end

  test "creating a Trabajo" do
    visit trabajos_url
    click_on "New Trabajo"

    fill_in "Descripcion", with: @trabajo.descripcion
    fill_in "Localizacion", with: @trabajo.localizacion
    fill_in "Presupuesto", with: @trabajo.presupuesto
    click_on "Create Trabajo"

    assert_text "Trabajo was successfully created"
    click_on "Back"
  end

  test "updating a Trabajo" do
    visit trabajos_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @trabajo.descripcion
    fill_in "Localizacion", with: @trabajo.localizacion
    fill_in "Presupuesto", with: @trabajo.presupuesto
    click_on "Update Trabajo"

    assert_text "Trabajo was successfully updated"
    click_on "Back"
  end

  test "destroying a Trabajo" do
    visit trabajos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trabajo was successfully destroyed"
  end
end
