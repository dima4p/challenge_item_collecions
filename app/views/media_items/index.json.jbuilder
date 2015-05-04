json.array!(@media_items) do |media_item|
  list = [:id, :name, :type, :user_id]
  case media_item
  when LinkItem
    list << 'link'
  when PhotoItem
    list << 'image'
  when VideoItem
    list << 'link'
  end
  json.extract! media_item, *list
  json.url media_item_url(media_item, format: :json)
end
