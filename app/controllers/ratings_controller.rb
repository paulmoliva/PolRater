class RatingsController < ApplicationController
  def index
    @user = current_user
    @characters = Character.all
    @categories = Category.all
  end

  # POST /ajax/vote
 def ajax_vote
     @user = current_user
     ch1 = params["ch1"].to_i
     ch2 = params["ch2"].to_i
     cat = params["cat"].to_i
     # Do something with input parameter and respond as JSON with the output
     @user.record_rating!(cat, ch1, ch2)

     respond_to do |format|
           format.json {render :json => {:result => "vote recorded!"}}
     end
 end

  helper_method :get_category
  def get_category(id)
    Category.find(id)
  end

  helper_method :get_character
  def get_character(id)
    Character.find(id)
  end
end
