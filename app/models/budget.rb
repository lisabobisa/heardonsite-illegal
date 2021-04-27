class Budget < ApplicationRecord
  belongs_to :member
  has_many :expenses
  enum time_frame: [ :monthly, :weekly, :custom ]
end
