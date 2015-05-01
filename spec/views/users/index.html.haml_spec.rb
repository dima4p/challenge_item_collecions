require 'rails_helper'

describe "users/index", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @user = create(:user)
    assign(:users, [@user, @user])
  end

  it "renders a list of users" do
    render

    assert_select 'tr>td', text: @user.email.to_s, count: 2
    assert_select 'tr>td', text: @user.name.to_s, count: 2
  end

end
