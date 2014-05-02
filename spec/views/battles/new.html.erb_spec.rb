require 'spec_helper'

describe "battles/new" do
  before(:each) do
    assign(:battle, stub_model(Battle,
      :name => "MyString",
      :tag_one => "MyString",
      :tag_two => "MyString"
    ).as_new_record)
  end

  it "renders new battle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", battles_path, "post" do
      assert_select "input#battle_name[name=?]", "battle[name]"
      assert_select "input#battle_tag_one[name=?]", "battle[tag_one]"
      assert_select "input#battle_tag_two[name=?]", "battle[tag_two]"
    end
  end
end
