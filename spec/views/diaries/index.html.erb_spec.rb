require 'rails_helper'

RSpec.describe "diaries/index", :type => :view do
  before(:each) do
    assign(:diaries, [
      Diary.create!(
        :category_id => 1,
        :title => "Title",
        :body => "Body",
        :wheather_id => 2,
        :mt_id => 3
      ),
      Diary.create!(
        :category_id => 1,
        :title => "Title",
        :body => "Body",
        :wheather_id => 2,
        :mt_id => 3
      )
    ])
  end

  it "renders a list of diaries" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
