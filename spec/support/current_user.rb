def current_user(stubs = {})
  return @mock_current_user if @mock_current_user
  stubs.reverse_merge! :is_admin? => true, name: 'Mock Current User'
  @mock_current_user = double :user,  stubs
end
