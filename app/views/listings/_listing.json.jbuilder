json.extract! listing, :id, :title, :cuisine, :description, :allergy, :price, :available_date, :sold, :created_at, :updated_at
json.url listing_url(listing, format: :json)
json.description listing.description.to_s
