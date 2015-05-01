require 'rails_helper'

describe "users/edit", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @user = assign(:user, create(:user))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action='#{user_path(@user)}'][method='post']" do
      assert_select 'input#user_email[name=?]', 'user[email]'
      assert_select 'input#user_name[name=?]', 'user[name]'
    end
  end
end
