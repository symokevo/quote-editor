require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end
  test "Creating a new quote" do
  # When you visit the Quotes#index page
  # Expect to see a title with the text "Quotes"
  vist quotes_path
  assert_selector "h1", text: "Quotes"

  # Click on the text "New Quote"
  # Expect to land on a page with the title "New Quote"
  click_on "New Quote"
  assert_selector "h1", text: "New Quote"

  # Fill in the name input with "Zimastack quote"
  # and click on "Create Quote"

  fill_in "Name", with: "Zimastack quote"
  click_on "Create quote"

  # Expect to be back on the page with the title "Quotes"
  # see your "Zimastack quote" in the list of quotes
  assert_selector "h1", text: "Quotes"
  assert_text "Zimastack quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Editing Quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
