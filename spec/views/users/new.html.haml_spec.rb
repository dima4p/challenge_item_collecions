require 'rails_helper'

describe "users/new", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @user = assign(:user, build(:user))
  end

  it "renders new user form" do
    render

    assert_select "form[action='#{users_path}'][method='post']" do
      assert_select 'input#user_email[name=?]', 'user[email]'
      assert_select 'input#user_name[name=?]', 'user[name]'
    end
  end
end
