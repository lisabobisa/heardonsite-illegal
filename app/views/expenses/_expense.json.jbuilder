json.extract! expense, :id, :approved, :budget_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
