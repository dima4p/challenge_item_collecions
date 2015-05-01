list = [:id, :name]
list << :email if can? :show_email, @user

json.extract! @user, *list
