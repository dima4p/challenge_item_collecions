require 'rails_helper'

describe "users/show.json.jbuilder", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @user = assign(:user, create(:user))
  end

  attributes = %w[
    id
    email
    name
  ]

  it "renders the following attributes of user: #{attributes.join(', ')} as json" do
    render

    hash = MultiJson.load rendered
    expect(hash.keys.sort).to eq attributes.sort
    expected = @user.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expect(hash).to eq expected
  end
end
