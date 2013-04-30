class Bad < ActiveRecord::Base
  attr_accessible   :description, :action, :solved, :retrospective_id, :votes
  after_initialize  :default_values
  attr_accessor     :times_being_kept

  belongs_to        :retrospective

  validates         :description, :action, :times_being_kept, :presence => true

  def keep!
    self.times_being_kept += 1
    self.solved = false
    self.preffix_description!
  end

  def preffix_description!
    preffix = "Recorrente: "
    self.description = preffix.concat(self.description) unless description.nil? || (description.include? preffix)
  end

  private
  def default_values
    self.times_being_kept ||= 0
  end
end
