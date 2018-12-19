class User < ApplicationRecord
  authenticates_with_sorcery!
  has_one_attached :icon

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, if: lambda {
    new_record? || changes[:crypted_password]
  }
end
