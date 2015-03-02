class User < ActiveRecord::Base
	ROLES = %w[admin company alumnus]
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
