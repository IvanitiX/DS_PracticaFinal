require "application_system_test_case"

class TecnicosControllersTest < ApplicationSystemTestCase
  setup do
    @tecnicos_controller = tecnicos_controllers(:one)
  end

  test "visiting the index" do
    visit tecnicos_controllers_url
    assert_selector "h1", text: "Tecnicos Controllers"
  end

  test "creating a Tecnicos controller" do
    visit tecnicos_controllers_url
    click_on "New Tecnicos Controller"

    click_on "Create Tecnicos controller"

    assert_text "Tecnicos controller was successfully created"
    click_on "Back"
  end

  test "updating a Tecnicos controller" do
    visit tecnicos_controllers_url
    click_on "Edit", match: :first

    click_on "Update Tecnicos controller"

    assert_text "Tecnicos controller was successfully updated"
    click_on "Back"
  end

  test "destroying a Tecnicos controller" do
    visit tecnicos_controllers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tecnicos controller was successfully destroyed"
  end
end
