json.extract! listing, :id, :title, :cuisine, :description, :price, :available_date, :sold, :user_id, :allergy_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
json.description listing.description.to_s
