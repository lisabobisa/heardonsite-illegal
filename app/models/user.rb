class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :families, through: :members
  has_one :member
  accepts_nested_attributes_for :member

  def is_a_parent?
    Member.find_by_user_id(id)&.role == 'parental'
  end
end
