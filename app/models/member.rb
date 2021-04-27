class Member < ApplicationRecord
  belongs_to :family
  has_many :budgets
  has_many :expenses, through: :budgets
  belongs_to :user
  enum role: [ :parental, :childish ]
end
