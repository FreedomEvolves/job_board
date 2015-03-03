class WelcomeController < ApplicationController
  def home
  end

  def admin
  	@user = User.all.ascend
  end

  def add_role
  	@user = User.all
  end

end
