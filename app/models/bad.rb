class Bad < ActiveRecord::Base
  attr_accessible :description, :action, :solved, :retrospective_id

  belongs_to :retrospective

  validates :description, :action, :presence =>true

  def preffix_description!
    self.description = "Nao corrigido: " + self.description unless description.nil?
  end
end
