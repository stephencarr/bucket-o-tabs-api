class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :image, :email, :provider
end
