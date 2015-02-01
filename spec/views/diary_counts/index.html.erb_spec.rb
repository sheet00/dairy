require 'rails_helper'

RSpec.describe "diary_counts/index", :type => :view do
  before(:each) do
    assign(:diary_counts, [
      DiaryCount.create!(
        :year => 1,
        :month => 2,
        :monthly_count => 3
      ),
      DiaryCount.create!(
        :year => 1,
        :month => 2,
        :monthly_count => 3
      )
    ])
  end

  it "renders a list of diary_counts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
