json.extract! api_v3_movie, :id, :name, :actor, :producer, :description, :net_worth, :starts_at, :price, :release_year, :created_at, :updated_at
json.url api_v3_movie_url(api_v3_movie, format: :json)
