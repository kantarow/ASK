class SearchController < ApplicationController
  def search
    key_words = params[:q].split(' ').map{|w| "%#{w}%" }
    @items = Item.none
    @users = User.none
    key_words.each do |w|
      @items = @items.or(Item.where("title like ? or content like ?", w, w))
      @users = @users.or(User.where("id_name like ? or screen_name like ?", w, w))
    end
  end
end
