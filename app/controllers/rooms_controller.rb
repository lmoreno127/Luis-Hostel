class RoomsController < ApplicationController
    def new
      @room=Room.new
    end
    def create
      room = Room.create!(room_params)
      room.is_booked = false
      flash[:success] = "Room #{room[:name]} was created successfully"
      redirect_to rooms_path 
    end
    def index
     @rooms = Room.all
    end
    def show
     id = params[:id]
     @room = Room.find(id)
    end
    def destroy
     id = params[:id]
     @room = Room.find(id)
     @room.destroy
     flash[:success] = 'The room was deleted successfully'
     redirect_to rooms_path
    end
    def update
     id = params[:id]
     @room = Room.find(id)
     @room.update(room_params)
     flash[:success] = 'The room was updated successfully'
     redirect_to room_path(@room)
   end
   def edit
     id = params[:id]
     @room = Room.find(id)
   end
   private
   def room_params
     params.require(:room).permit(:title,:description,:price,:max_guests)
   end
end
