class User < ActiveRecord::Base

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :updated_at, -> {where(updated_at: asc)}

  def self.ascend
    order('updated_at asc')
  end       
end
