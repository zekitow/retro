class Bad < ActiveRecord::Base
  after_initialize      :default_values
  attr_accessible       :description, :action, :solved, :retrospective_id
  attr_accessor         :times_being_kept
  belongs_to            :retrospective
  validates             :description, :action, :times_being_kept, :presence => true

  def preffix_description!
    self.description = "Recorrente: ".concat(self.description) unless description.nil? || times_being_kept > 1
  end

  def keep!
    self.times_being_kept += 1
    self.solved = false
  end

  private
    def default_values
      self.times_being_kept ||= 0
    end
end
