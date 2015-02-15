require 'rails_helper'

RSpec.describe "weathers/index", type: :view do
  before(:each) do
    assign(:weathers, [
      Weather.create!(
        :id => 1,
        :file_name => "File Name"
      ),
      Weather.create!(
        :id => 1,
        :file_name => "File Name"
      )
    ])
  end

  it "renders a list of weathers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
  end
end
