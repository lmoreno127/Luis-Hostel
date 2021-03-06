class UsersController < ApplicationController
   def new
    @room=Room.find(params[:room_id])
    @user=User.new
   end
   def create
     @room=Room.find(params[:room_id])
     user = User.create(user_params)
     flash[:success] = "Welcome #{user[:name]} to Luis Hostel"
     redirect_to room_path(@room) 
   end
   def index
    @room=Room.find(params[:room_id])
    @users = User.all
   end
   def show
    @room=Room.find(params[:room_id])
    id = params[:id]
    @user = User.find(id)
   end
   def destroy
    @room=Room.find(params[:room_id])
    id = params[:id]
    @user = User.find(id)
    @user.destroy
    flash[:success] = 'Your account was deleted successfully'
    redirect_to room_users_path(@room)
   end
   def update
    @room=Room.find(params[:room_id])
    id = params[:id]
    @user = User.find(id)
    @user.update(user_params)
    flash[:success] = 'your account was updated successfully'
    redirect_to room_user_path(@room,@user)
  end
  def edit
    @room=Room.find(params[:room_id])
    id = params[:id]
    @user = User.find(id)
  end
  private
  def user_params
    params.require(:user).permit(:name,:last_name,:profile_photo,:cardnumber,:namecard,:expirationdate,:cvv)
  end
end
