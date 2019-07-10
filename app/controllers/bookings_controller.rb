class BookingsController < ApplicationController
    def new
      @user=current_user
      @room=Room.find(params[:room_id])
      @booking=Booking.new 
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
     @bookings = Booking.all
    end
    def show
     id = params[:id]
     @booking = Review.find(id)
    end
    def destroy
     id = params[:id]
     @booking = Booking.find(id)
     @booking.destroy
     flash[:success] = 'Booking was deleted successfully'
     #redirect_to '/dogs/index'
    end
    def update
     id = params[:id]
     @booking = Booking.find(id)
     @booking.update(booking_params)
     @booking.booking_id = params[:booking_id]

     flash[:success] = 'booking was updated successfully'
     #redirect_to dog_edit_path(@dog)
   end
   def edit
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
