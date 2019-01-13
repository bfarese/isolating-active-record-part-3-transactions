class Users::Repository
  def initialize(relation: Users::Relation, klass: Users::User)
    @relation = relation
    @klass = klass
  end

  def all
    all_relations.map { |attrs| @klass.new(attrs) }
  end

  def find(id)
    @klass.new(relation_attributes(id))
  end

  def find_name(id)
    @klass.new(relation_name(id))
  end

  def create(params)
    @klass.new(relation_create(params))
  end

  private

  def all_relations
    @relation.find_all
  end

  def relation_attributes(id)
    @relation.attribute_values(id)
  end

  def relation_name(id)
    @relation.find_name(id)
  end

  def relation_create(params)
    @relation.creation(params)
  end
end
