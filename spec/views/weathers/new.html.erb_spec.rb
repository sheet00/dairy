require 'rails_helper'

RSpec.describe "weathers/new", type: :view do
  before(:each) do
    assign(:weather, Weather.new(
      :id => 1,
      :file_name => "MyString"
    ))
  end

  it "renders new weather form" do
    render

    assert_select "form[action=?][method=?]", weathers_path, "post" do

      assert_select "input#weather_id[name=?]", "weather[id]"

      assert_select "input#weather_file_name[name=?]", "weather[file_name]"
    end
  end
end
