require 'rails_helper'

RSpec.describe "weathers/edit", type: :view do
  before(:each) do
    @weather = assign(:weather, Weather.create!(
      :id => 1,
      :file_name => "MyString"
    ))
  end

  it "renders the edit weather form" do
    render

    assert_select "form[action=?][method=?]", weather_path(@weather), "post" do

      assert_select "input#weather_id[name=?]", "weather[id]"

      assert_select "input#weather_file_name[name=?]", "weather[file_name]"
    end
  end
end
