class FavoritesController < ApplicationController
    #お気に入り登録用アクション
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorite(@micropost)
    redirect_to :back
  end

  #お気に入り削除用アクション
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.unfavorite(@micropost)
    redirect_to :back
  end
end
