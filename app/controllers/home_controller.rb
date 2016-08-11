class HomeController < ApplicationController
  def show
    if current_user
      redirect_to ratings_path
    end
  end
end
