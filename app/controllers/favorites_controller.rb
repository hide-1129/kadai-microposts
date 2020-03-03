class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to likes_user_path(current_user)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav_microposts(micropost)
    flash[:success] = 'お気に入りを削除しました。'
    redirect_to micropost_url
  end
end
