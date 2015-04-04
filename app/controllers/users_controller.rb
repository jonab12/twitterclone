class UsersController < ApplicationController
  
  def show
     @user = User.find(params[:id]) #params[:id] is users/id,  
     #debugger
  end
  
  def new
    @user = User.new
  end
  
  def create #taken from the POST form method of new.html
    @user = User.new(user_params) 
    if @user.save
      #handle a successful save
    else
      render 'new'
    end
  end
  
  private
  
   def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
   end
  
end
