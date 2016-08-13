class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  end

  def faq
  end

  def headlines
  end

end
