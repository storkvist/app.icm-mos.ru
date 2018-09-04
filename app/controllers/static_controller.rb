class StaticController < ApplicationController
  def authorized_home
    authenticate_user!
  end
end
