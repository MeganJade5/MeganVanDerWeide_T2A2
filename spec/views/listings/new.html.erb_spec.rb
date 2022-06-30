require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      title: "MyString",
      cuisine: "MyString",
      description: nil,
      allergy: "MyString",
      price: 1,
      available_date: "MyString",
      sold: false
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[cuisine]"

      assert_select "input[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[allergy]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[available_date]"

      assert_select "input[name=?]", "listing[sold]"
    end
  end
end
