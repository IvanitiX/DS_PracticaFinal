require "application_system_test_case"

class PropuestasTest < ApplicationSystemTestCase
  setup do
    @propuesta = propuestas(:one)
  end

  test "visiting the index" do
    visit propuestas_url
    assert_selector "h1", text: "Propuestas"
  end

  test "creating a Propuestas" do
    visit propuestas_url
    click_on "New Propuestas"

    fill_in "Id tecnico", with: @propuesta.id_tecnico
    fill_in "Id trabajo", with: @propuesta.id_trabajo
    click_on "Create Propuestas"

    assert_text "Propuestas was successfully created"
    click_on "Back"
  end

  test "updating a Propuestas" do
    visit propuestas_url
    click_on "Edit", match: :first

    fill_in "Id tecnico", with: @propuesta.id_tecnico
    fill_in "Id trabajo", with: @propuesta.id_trabajo
    click_on "Update Propuestas"

    assert_text "Propuestas was successfully updated"
    click_on "Back"
  end

  test "destroying a Propuestas" do
    visit propuestas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Propuestas was successfully destroyed"
  end
end
