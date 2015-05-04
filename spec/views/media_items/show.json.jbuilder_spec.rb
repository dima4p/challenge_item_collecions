require 'rails_helper'

describe "media_items/show.json.jbuilder", type: :view do
  let (:media_item) {create :media_item}
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign(:media_item, media_item)
  end

  attributes = %w[
    id
    name
    type
    user_id
    created_at
    updated_at
  ]
  link_attributes = attributes + ['link']
  photo_attributes = attributes + ['image']
  video_attributes = attributes + ['link']

  it 'should show user_url instead of user_id'

  describe 'for LinkItem' do
    let(:media_item) {create :link_item}

    it "renders the following attributes of media_item: #{link_attributes.join(', ')} as json" do
      render

      hash = MultiJson.load rendered
      expect(hash.keys.sort).to eq link_attributes.sort
      expected = media_item.attributes.slice *link_attributes
      expected = MultiJson.load MultiJson.dump expected
      expect(hash).to eq expected
    end
  end

  describe 'for PhotoItem' do
    let(:media_item) {create :photo_item}

    it "renders the following attributes of media_item: #{photo_attributes.join(', ')} as json" do
      render

      hash = MultiJson.load rendered
      expect(hash.keys.sort).to eq photo_attributes.sort
      expected = media_item.attributes.slice *photo_attributes
      expected = MultiJson.load MultiJson.dump expected
      expect(hash).to eq expected
    end
  end

  describe 'for VideoItem' do
    let(:media_item) {create :video_item}

    it "renders the following attributes of media_item: #{video_attributes.join(', ')} as json" do
      render

      hash = MultiJson.load rendered
      expect(hash.keys.sort).to eq video_attributes.sort
      expected = media_item.attributes.slice *video_attributes
      expected = MultiJson.load MultiJson.dump expected
      expect(hash).to eq expected
    end
  end
end
