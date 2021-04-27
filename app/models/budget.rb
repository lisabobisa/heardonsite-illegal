class Budget < ApplicationRecord
  belongs_to :member
  enum time_frame: [ :monthly, :weekly, :custom ]
end
