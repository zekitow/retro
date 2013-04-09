module ApplicationHelper

  def item_votes_id(item)
    "votes-#{item.class.to_s.downcase}-#{item.id}"
  end
end
