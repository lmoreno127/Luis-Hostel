class BookingsController < ApplicationController
    def new
      @user=current_user
      @room=Room.find(params[:room_id])
      @booking=Booking.new
      if @user.cardnumber.nil?
        redirect_to edit_room_user_path(@room,@user)
      end 
    end
    def create
      @user=current_user
      @room=Room.find(params[:room_id])
      #@user.update()
      new_booking=Booking.new(booking_params)
      new_booking.user = @user
      new_booking.room = @room
      new_booking.save
      flash[:success] = "Booking was created successfully"
      @room.update(is_booked:true)
      redirect_to root_path 
    end
    def index
      @user=current_user
      @room=Room.find(params[:room_id]) 
      @bookings = Booking.all
    end
    def show
      @user=current_user
      @room=Room.find(params[:room_id])
      id = params[:id]
      @booking = Booking.find(id)
    end
    def destroy
      @user=current_user
      @room=Room.find(params[:room_id]) 
      id = params[:id]
      @booking = Booking.find(id)
      @booking.destroy
      flash[:success] = 'Booking was deleted successfully'
      redirect_to room_user_bookings_path(@room,@user)
    end
    def update
     @user=current_user
     @room=Room.find(params[:room_id])
     id = params[:id]
     @booking = Booking.find(id)
     @booking.update(booking_params)
    flash[:success] = 'booking was updated successfully'
     redirect_to room_user_booking_path(@room,@user,@booking)
   end
   def edit
     @user=current_user
     @room=Room.find(params[:room_id])
     id = params[:id]
     @booking = Booking.find(id)
   end
   private
   def booking_params
     params.require(:booking).permit(:guests,:check_in,:check_out)
   end
end
# Card Number: <%= f.text_field :cardnumber %><br />
#   Name On Card: <%= f.text_field :namecard %><br />
#   Expiration Date:<%= f.date_field :expirationdate %><br />
#   CVV:<%= f.text_field :cvv %><br />
