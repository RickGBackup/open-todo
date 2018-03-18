class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at, :lists, :items
  
  has_many :items, serializer: ItemSerializer::LimitedItemSerializer
  has_many :lists, serializer: ListSerializer::LimitedListSerializer
end
