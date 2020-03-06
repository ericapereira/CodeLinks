json.extract! user, :id, :name, :email, :phone_number, :city, :account_type, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
