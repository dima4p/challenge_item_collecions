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
    created_at
    updated_at
  ]

  it "renders the following attributes of user: #{attributes.join(', ')} as json" do
    render

    hash = MultiJson.load rendered
    expect(hash.keys.sort).to eq attributes.sort
    expected = @user.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expect(hash).to eq expected
    # expect(hash['id']).to eq @user.id.to_s
    # expect(hash['email']).to eq @user.email.to_s
    # expect(hash['name']).to eq @user.name.to_s
    # expect(hash['created_at']).to eq @user.created_at.to_s
    # expect(hash['updated_at']).to eq @user.updated_at.to_s
  end
end
