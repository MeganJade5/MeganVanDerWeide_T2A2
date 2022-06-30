require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      title: "Title",
      cuisine: "Cuisine",
      description: nil,
      allergy: "Allergy",
      price: 2,
      available_date: "Available Date",
      sold: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Cuisine/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Allergy/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Available Date/)
    expect(rendered).to match(/false/)
  end
end
