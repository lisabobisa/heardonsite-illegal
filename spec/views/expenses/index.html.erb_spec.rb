require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        approved: false,
        budget: nil
      ),
      Expense.create!(
        approved: false,
        budget: nil
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
