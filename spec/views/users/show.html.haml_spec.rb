require 'rails_helper'

describe "users/show", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @user = assign(:user, create(:user))
  end

  it "renders attributes in <dl>" do
    render
    assert_select 'dl>dd', text: Regexp.new(@user.email.to_s)
    assert_select 'dl>dd', text: Regexp.new(@user.name.to_s)
  end
end
