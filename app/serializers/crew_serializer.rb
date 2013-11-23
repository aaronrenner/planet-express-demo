class CrewSerializer < ActiveModel::Serializer
  attributes :id, :age, :name, :avatar, :title, :species, :origin
end
