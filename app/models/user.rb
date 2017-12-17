class User < ApplicationRecord
  has_secure_password
  validates :user_name, :password, presence: true, on: create
  # validate  :birthday?

  enum role: ['học sinh', 'giáo viên', 'quản trị viên']
  enum gender: ['Nam', 'Nữ', 'Ngại quá à']
end
