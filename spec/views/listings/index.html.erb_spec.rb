require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        title: "Title",
        cuisine: "Cuisine",
        description: nil,
        allergy: "Allergy",
        price: 2,
        available_date: "Available Date",
        sold: false
      ),
      Listing.create!(
        title: "Title",
        cuisine: "Cuisine",
        description: nil,
        allergy: "Allergy",
        price: 2,
        available_date: "Available Date",
        sold: false
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Cuisine".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Allergy".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Available Date".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
