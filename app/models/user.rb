class User < ApplicationRecord
  has_secure_password
  validates :user_name, :password, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  # validate  :birthday?

  enum role: ['học sinh', 'giáo viên', 'quản trị viên']
  enum gender: ['Nam', 'Nữ', 'Ngại quá à']
end
