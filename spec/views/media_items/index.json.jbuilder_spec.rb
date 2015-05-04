require 'rails_helper'

describe "media_items/index.json.jbuilder", type: :view do
  let(:media_item) {create :media_item}
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign :media_items, [media_item, media_item]
  end

  attributes = %w[
    id
    name
    type
    user_id
    url
  ]
  link_attributes = attributes + ['link']
  photo_attributes = attributes + ['image']
  video_attributes = attributes + ['link']

  describe 'for LinkItem' do
    let(:media_item) {create :link_item}

    it "renders a list of media_items as json with following attributes: #{link_attributes.join(', ')}" do
      render

      hash = MultiJson.load rendered
      expect(hash.first).to eq(hash = hash.last)
      expect(hash.keys.sort).to eq attributes.sort
      expected = media_item.attributes.slice *attributes
      expected = MultiJson.load MultiJson.dump expected
      expected['url'] = media_item_url(media_item, format: 'json')
      expect(hash).to eq expected
    end
  end

  describe 'for PhotoItem' do
    let(:media_item) {create :link_item}

    it "renders a list of media_items as json with following attributes: #{photo_attributes.join(', ')}" do
      render

      hash = MultiJson.load rendered
      expect(hash.first).to eq(hash = hash.last)
      expect(hash.keys.sort).to eq attributes.sort
      expected = media_item.attributes.slice *attributes
      expected = MultiJson.load MultiJson.dump expected
      expected['url'] = media_item_url(media_item, format: 'json')
      expect(hash).to eq expected
    end
  end

  describe 'for VideoItem' do
    let(:video_item) {create :link_item}

    it "renders a list of media_items as json with following attributes: #{link_attributes.join(', ')}" do
      render

      hash = MultiJson.load rendered
      expect(hash.first).to eq(hash = hash.last)
      expect(hash.keys.sort).to eq attributes.sort
      expected = media_item.attributes.slice *attributes
      expected = MultiJson.load MultiJson.dump expected
      expected['url'] = media_item_url(media_item, format: 'json')
      expect(hash).to eq expected
    end
  end
end
