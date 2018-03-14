class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :list_id, :user_id, :created_at, :updated_at
end
