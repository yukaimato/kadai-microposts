class FavoritesController < ApplicationController
   before_action :require_user_logged_in

 def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = '投稿をお気に入りに追加しました。'
    redirect_to user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = '投稿をお気に入りから外しました。'
    redirect_to user
  end
end
