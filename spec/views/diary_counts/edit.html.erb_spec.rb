require 'rails_helper'

RSpec.describe "diary_counts/edit", :type => :view do
  before(:each) do
    @diary_count = assign(:diary_count, DiaryCount.create!(
      :year => 1,
      :month => 1,
      :monthly_count => 1
    ))
  end

  it "renders the edit diary_count form" do
    render

    assert_select "form[action=?][method=?]", diary_count_path(@diary_count), "post" do

      assert_select "input#diary_count_year[name=?]", "diary_count[year]"

      assert_select "input#diary_count_month[name=?]", "diary_count[month]"

      assert_select "input#diary_count_monthly_count[name=?]", "diary_count[monthly_count]"
    end
  end
end
