class Job < ActiveRecord::Base

	#scope order('updated_at desc')
  scope :updated_at, -> {where(updated_at: desc)}

  def self.descend
    order('updated_at desc')
  end
end
