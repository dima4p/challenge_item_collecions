json.array!(@media_items) do |media_item|
  json.extract! media_item, :id, :name, :type, :user_id, :link, :image
  json.url media_item_url(media_item, format: :json)
end
