class UsersController < ApplicationController
   def new 
   end
   def create
      user = User.create(user_params)
     user.is_admin = false
     flash[:success] = "Welcome #{user[:name]} to Luis Hostel"
     #redirect_to edit_user 
   end
   def index
    @users = User.all
   end
   def show
    id = params[:id]
    @user = User.find(id)
   end
   def delete
    id = params[:id]
    @user = User.find(id)
    @user.destroy
    flash[:success] = 'Your account was deleted successfully'
    #redirect_to '/dogs/index'
   end
   def update
    id = params[:id]
    @user = User.find(id)
    @user.update(user_params)
    flash[:success] = 'your account was updated successfully'
    #redirect_to dog_edit_path(@dog)
  end
  def edit
    id = params[:id]
    @user = User.find(id)
  end
  private
  def user_params
    params.require(:user).permit(:name,:last_name,:email,:cardnumber,:namecard,:expirationdate,:cvv)
  end
end
