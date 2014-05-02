require 'spec_helper'

describe "battles/edit" do
  before(:each) do
    @battle = assign(:battle, stub_model(Battle,
      :name => "MyString",
      :tag_one => "MyString",
      :tag_two => "MyString"
    ))
  end

  it "renders the edit battle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", battle_path(@battle), "post" do
      assert_select "input#battle_name[name=?]", "battle[name]"
      assert_select "input#battle_tag_one[name=?]", "battle[tag_one]"
      assert_select "input#battle_tag_two[name=?]", "battle[tag_two]"
    end
  end
end
