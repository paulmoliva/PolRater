class RatingsController < ApplicationController
  before_filter :require_login, except: [:index]


  def index
    if params[:notice]
      notice = params[:notice].split(",").map(&:to_i)
      flash.now.notice = "You think #{Character.find(notice[1]).character_name} is #{Category.find(notice[0]).category_name} than #{Character.find(notice[2]).character_name}!"
    end
    @user = current_user
    @characters = Character.all
    @categories = Category.all
    @num_categories = Category.all.count
  end



  # POST /ajax/vote
 def ajax_vote
     @user = current_user

     ch1 = params["ch1"].to_i
     ch2 = params["ch2"].to_i
     cat = params["cat"].to_i
     # Do something with input parameter and respond as JSON with the output
     @user.record_rating!(cat, ch1, ch2)
     flash.notice = "vote!"
     respond_to do |format|
       format.json {render :json => {:notice => "vote recorded!"}}
     end
    #  render 'ratings'
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
