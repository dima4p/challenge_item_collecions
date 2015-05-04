require 'rails_helper'

describe "media_items/show", type: :view do
  let (:media_item) {create :media_item}
  before(:each) do
    allow(controller).to receive(:can?).and_return(true)
    assign(:media_item, media_item)
  end

  describe 'for LinkItem' do
    let(:media_item) {create :link_item, image: 'image'}

    it "renders attributes in <dl> without image" do
      render
      assert_select 'dl>dd', text: Regexp.new(media_item.name.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.type.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.user.name)
      assert_select 'dl>dd', text: Regexp.new(media_item.link.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.image.to_s), count: 0
    end
  end


  describe 'for PhotoItem' do
    let(:media_item) {create :photo_item, link: 'link'}

    it "renders attributes in <dl> without image" do
      render
      assert_select 'dl>dd', text: Regexp.new(media_item.name.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.type.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.user.name)
      assert_select 'dl>dd', text: Regexp.new(media_item.link.to_s), count: 0
      assert_select 'dl>dd', text: Regexp.new(media_item.image.to_s)
    end
  end
  describe 'for VideoItem' do
    let(:media_item) {create :video_item, image: 'image'}

    it "renders attributes in <dl> without image" do
      render
      assert_select 'dl>dd', text: Regexp.new(media_item.name.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.type.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.user.name)
      assert_select 'dl>dd', text: Regexp.new(media_item.link.to_s)
      assert_select 'dl>dd', text: Regexp.new(media_item.image.to_s), count: 0
    end
  end
end
