class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      @user.user_id = current_user.id
    if @user.update(user_params)
       redirect_to  admin_users_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
      user.destroy
    redirect_to admin_users_path, danger: "ユーザー情報を削除しました。"
  end

   private

 def user_params
   params.require(:user).permit(:name, :image_id, :introduction, :team_id)
 end
end
