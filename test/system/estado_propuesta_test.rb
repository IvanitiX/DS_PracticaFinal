require "application_system_test_case"

class EstadoPropuestaTest < ApplicationSystemTestCase
  setup do
    @estado_propuestum = estado_propuesta(:one)
  end

  test "visiting the index" do
    visit estado_propuesta_url
    assert_selector "h1", text: "Estado Propuesta"
  end

  test "creating a Estado propuestum" do
    visit estado_propuesta_url
    click_on "New Estado Propuestum"

    fill_in "Estado", with: @estado_propuestum.estado
    click_on "Create Estado propuestum"

    assert_text "Estado propuestum was successfully created"
    click_on "Back"
  end

  test "updating a Estado propuestum" do
    visit estado_propuesta_url
    click_on "Edit", match: :first

    fill_in "Estado", with: @estado_propuestum.estado
    click_on "Update Estado propuestum"

    assert_text "Estado propuestum was successfully updated"
    click_on "Back"
  end

  test "destroying a Estado propuestum" do
    visit estado_propuesta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estado propuestum was successfully destroyed"
  end
end
