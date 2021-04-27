require 'rails_helper'

RSpec.describe "budgets/new", type: :view do
  before(:each) do
    assign(:budget, Budget.new(
      category: "MyString",
      member: nil,
      time_frame: 1,
      days: 1
    ))
  end

  it "renders new budget form" do
    render

    assert_select "form[action=?][method=?]", budgets_path, "post" do

      assert_select "input[name=?]", "budget[category]"

      assert_select "input[name=?]", "budget[member_id]"

      assert_select "input[name=?]", "budget[time_frame]"

      assert_select "input[name=?]", "budget[days]"
    end
  end
end
