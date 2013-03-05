class Retrospective < ActiveRecord::Base
  attr_accessible :sprint_number

  belongs_to :user

  has_many :goods
  has_many :bads

  validates :sprint_number, :presence =>true

  def self.add_sprint_for(user)
    retro = Retrospective.new
    retro.sprint_number =  Retrospective.where(user_id: user.id).count + 1
    retro.user_id = user.id
    retro.save
  end
end
