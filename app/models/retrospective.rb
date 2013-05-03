class Retrospective < ActiveRecord::Base
  attr_accessible :name, :start_at, :finish_at

  belongs_to :user

  has_many :goods
  has_many :bads

  has_and_belongs_to_many :invited_users,
                          :class_name => "User",
                          :join_table => "users_retrospectives",
                          :association_foreign_key => "user_id"

  validates :name, :user_id, presence: true
  validates :start_at , presence: true, if: :finish_at?
  validates :finish_at, presence: true, if: :start_at?
end
