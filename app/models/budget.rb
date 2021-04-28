class Budget < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :member
  has_many :expenses
  enum time_frame: [ :monthly, :weekly, :custom ]

  def recent_expenses
    expenses.where('created_at >= ?', since_when) || []
  end

  def spent
    recent_expenses.map(&:cost).inject(0){|sum,x| sum + x }
  end

  def progress
    number_to_percentage((spent.to_f / cap)*100)
  end

  def time_frame_display
    time_frame == 'custom' ? "#{days} days" : time_frame.to_s.capitalize
  end

  private

  def since_when
    if time_frame == 'monthly'
      return 1.month.ago
    elsif time_frame == 'weekly'
      return 1.week.ago
    elsif time_frame == 'custom'
      return days.to_i.days.ago
    end
  end
end
