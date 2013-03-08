class Retrospective < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user

  has_many :goods
  has_many :bads

  validates :name, :user_id, :presence =>true
end
