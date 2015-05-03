require 'rails_helper'

describe "media_items/index.json.jbuilder", type: :view do
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    @media_item = create(:media_item)
    assign :media_items, [@media_item, @media_item]
  end

  attributes = %w[
    id
    name
    type
    user_id
    link
    image
    url
  ]

  it "renders a list of media_items as json with following attributes: #{attributes.join(', ')}" do
    render

    hash = MultiJson.load rendered
    expect(hash.first).to eq(hash = hash.last)
    expect(hash.keys.sort).to eq attributes.sort
    expected = @media_item.attributes.slice *attributes
    expected = MultiJson.load MultiJson.dump expected
    expected['url'] = media_item_url(@media_item, format: 'json')
    expect(hash).to eq expected
    # expect(hash['id']).to eq @media_item.id.to_s
    # expect(hash['name']).to eq @media_item.name.to_s
    # expect(hash['type']).to eq @media_item.type.to_s
    # expect(hash['user']).to eq @media_item.user.to_s
    # expect(hash['link']).to eq @media_item.link.to_s
    # expect(hash['image']).to eq @media_item.image.to_s
    # expect(hash['url']).to eq media_item_url(@media_item, format: 'json')
  end
end
