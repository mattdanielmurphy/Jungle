json.extract! email_user, :id, :name, :email, :login, :created_at, :updated_at
json.url email_user_url(email_user, format: :json)