require 'rails_helper'

RSpec.describe "diaries/edit", :type => :view do
  before(:each) do
    @diary = assign(:diary, Diary.create!(
      :category_id => 1,
      :title => "MyString",
      :body => "MyString",
      :wheather_id => 1,
      :mt_id => 1
    ))
  end

  it "renders the edit diary form" do
    render

    assert_select "form[action=?][method=?]", diary_path(@diary), "post" do

      assert_select "input#diary_category_id[name=?]", "diary[category_id]"

      assert_select "input#diary_title[name=?]", "diary[title]"

      assert_select "input#diary_body[name=?]", "diary[body]"

      assert_select "input#diary_wheather_id[name=?]", "diary[wheather_id]"

      assert_select "input#diary_mt_id[name=?]", "diary[mt_id]"
    end
  end
end
