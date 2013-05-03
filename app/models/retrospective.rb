class Retrospective < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user

  has_many :goods
  has_many :bads

  has_and_belongs_to_many :invited_users,
                          :class_name => "User",
                          :join_table => "users_retrospectives",
                          :association_foreign_key => "user_id"

  validates :name, :user_id, :presence =>true
end
