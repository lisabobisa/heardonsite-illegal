class Family < ApplicationRecord
  has_many :members
  has_many :budgets, through: :members
  accepts_nested_attributes_for :members
end
