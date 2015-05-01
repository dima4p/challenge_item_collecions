require 'rails_helper'

describe "users/index.json.jbuilder", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @user = create(:user)
    assign :users, [@user, @user]
  end

  attributes = %w[
    id
    email
    name
    url
  ]

  it "renders a list of users as json with following attributes: #{attributes.join(', ')}" do
    render

    hash = MultiJson.load rendered
    expect(hash.first).to eq(hash = hash.last)
    expect(hash.keys.sort).to eq attributes.sort
    expected = @user.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expected['url'] = user_url(@user, format: 'json')
    expect(hash).to eq expected
    # expect(hash['id']).to eq @user.id.to_s
    # expect(hash['email']).to eq @user.email.to_s
    # expect(hash['name']).to eq @user.name.to_s
    # expect(hash['url']).to eq user_url(@user, format: 'json')
  end
end
