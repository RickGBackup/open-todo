class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :created_at, :updated_at, :items

  has_many :items, serializer: ItemSerializer::LimitedItemSerializer
  
  class LimitedListSerializer < ActiveModel::Serializer
    attributes  :title, :id
  end
  
end
