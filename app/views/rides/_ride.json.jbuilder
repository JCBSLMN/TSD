json.extract! ride, :id, :user_id, :location, :first_name, :last_name, :email, :details, :duration, :cost, :created_at, :updated_at
json.url ride_url(ride, format: :json)
