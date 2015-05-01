json.array!(@users) do |user|
  list = [:id, :name]
  list << :email if can? :show_email, user
  json.extract! user, *list
  json.url user_url(user, format: :json)
end
