class UserLinkSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  has_one :link
end
