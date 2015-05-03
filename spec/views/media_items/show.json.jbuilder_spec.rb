require 'rails_helper'

describe "media_items/show.json.jbuilder", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @media_item = assign(:media_item, create(:media_item))
  end

  attributes = %w[
    id
    name
    type
    user_id
    link
    image
    created_at
    updated_at
  ]

  it "renders the following attributes of media_item: #{attributes.join(', ')} as json" do
    render

    hash = MultiJson.load rendered
    expect(hash.keys.sort).to eq attributes.sort
    expected = @media_item.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expect(hash).to eq expected
    # expect(hash['id']).to eq @media_item.id.to_s
    # expect(hash['name']).to eq @media_item.name.to_s
    # expect(hash['type']).to eq @media_item.type.to_s
    # expect(hash['user']).to eq @media_item.user.to_s
    # expect(hash['link']).to eq @media_item.link.to_s
    # expect(hash['image']).to eq @media_item.image.to_s
    # expect(hash['created_at']).to eq @media_item.created_at.to_s
    # expect(hash['updated_at']).to eq @media_item.updated_at.to_s
  end
end
