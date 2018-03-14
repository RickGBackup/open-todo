class ListSerializer < ActiveModel::Serializer
   attributes :id, :title, :user_id, :created_at, :updated_at, :items
  
  def items
    # iterate through items. Return an array of item names and IDs.
    object.items.each_with_object([]) do |item, arr|
    arr << { name: item.name, id: item.id  }
    end
  end
end
