list = [:id, :name, :type, :user_id, :created_at, :updated_at]
if @media_item.is_a? PhotoItem
  list << :image
else
  list << :link
end
json.extract! @media_item, *list
