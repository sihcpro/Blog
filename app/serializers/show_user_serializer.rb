class ShowUserSerializer < ActiveModel::Serializer
  attributes :email, :user_name, :gender, :role
end
