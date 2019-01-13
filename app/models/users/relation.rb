class Users::Relation < ApplicationRecord
  def self.find_all
    all.pluck_to_hash(:id, :name, :email)
  end

  def self.attribute_values(id)
    where(id: id).pluck_to_hash(:id, :name, :email)[0]
  end

  def self.find_name(id)
    where(id: id).pluck(:name)[0]
  end

  def self.creation(params)
    relation = create(params)

    { id: relation.id, name: relation.name, email: relation.email }
  end
end
