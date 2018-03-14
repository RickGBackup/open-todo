class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at, :lists, :items
  
  def lists
    # iterate through lists. Return an array of list titles and IDs.
    object.lists.each_with_object([]) do |list, arr|
    arr << { title: list.title, id: list.id  }
    end
  end
  
  def items
    # iterate through items. Return an array of item names and IDs.
    object.items.each_with_object([]) do |item, arr|
    arr << { name: item.name, id: item.id  }
    end
  end
end
