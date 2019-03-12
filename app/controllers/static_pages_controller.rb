class StaticPagesController < ApplicationController
  def home
  end

  def change_tab
    case params[:tab]
    when "users"
      @partial = "following_users"
    when "tags"
      @partial = "following_tags"
    else
      puts "Error"
    end
  end
end
