json.extract! user, :id, :name, :email, :email_confirmed, :confirm_token, :created_at, :updated_at
json.url user_url(user, format: :json)
