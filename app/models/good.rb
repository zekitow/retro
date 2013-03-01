class Good < ActiveRecord::Base
  attr_accessible :description, :retrospective_id

  belongs_to :retrospective

  validates :description, :presence =>true
end
