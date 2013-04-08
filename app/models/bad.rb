class Bad < ActiveRecord::Base
  attr_accessible :description, :action, :solved, :retrospective_id, :votes

  belongs_to :retrospective

  validates :description, :action, :presence =>true
end
