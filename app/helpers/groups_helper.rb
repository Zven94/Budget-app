module GroupsHelper
  def total_entity_amount(group)
    group.entities.sum(:amount)
  end
end
