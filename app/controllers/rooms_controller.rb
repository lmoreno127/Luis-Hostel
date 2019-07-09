class RoomsController < ApplicationController
    def new 
    end
    def create
      room = Room.create(room_params)
      room.is_booked = false
      flash[:success] = "Room #{room[:name]} was created successfully"
      #redirect_to edit_user 
    end
    def index
     @rooms = Room.all
    end
    def show
     id = params[:id]
     @room = Room.find(id)
    end
    def delete
     id = params[:id]
     @room = Room.find(id)
     @room.destroy
     flash[:success] = 'The room was deleted successfully'
     #redirect_to '/dogs/index'
    end
    def update
     id = params[:id]
     @room = Room.find(id)
     @user.update(room_params)
     flash[:success] = 'The room was updated successfully'
     #redirect_to dog_edit_path(@dog)
   end
   def edit
     id = params[:id]
     @user = Room.find(id)
   end
   private
   def room_params
     params.require(:room).permit(:title,:description,:price)
   end
end
