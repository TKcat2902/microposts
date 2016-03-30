class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  
  
  
  def show
   @user = User.find(params[:id])
  end
  

  def new
    @user = User.new
  end
  

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end



 def edit　#before_action及びcorrect_userメソッド

 end

 


 def update　#before_action及びcorrect_userメソッド
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
      # 更新に成功したときの処理
    else
      render 'edit'
      # 更新に失敗したときの処理
    end
 end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :age, :region, :selfintroduction, :password_confirmation)
  end
  
  
  
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
  end


end