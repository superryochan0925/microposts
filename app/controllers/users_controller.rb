class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  
  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
    @favorites = Favorite.where("user_id = ?", @user)
  end

  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Update Profile"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @title = "Followings"
    @user = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follow'
  end
  
  def favorites
    @title = "Favorites"
    @user = User.find(params[:id])
    @microposts = @user.favorite_microposts
    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :location, :gender,
                                 :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end
end


