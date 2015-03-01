class Job < ActiveRecord::Base

	validates :company_name, :city, :title, :category, :jobtype, :description, :how_to_apply, presence: true
	
	#scope order('updated_at desc')
  scope :updated_at, -> {where(updated_at: desc)}

  def self.descend
    order('updated_at desc')
  end
end
