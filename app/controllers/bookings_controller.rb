class BookingController < ApplicationController
    def new
      @booking=Booking.new 
    end
    def create
      Booking.create(booking_params)
      flash[:success] = "Booking was created successfully"
      #redirect_to edit_booking 
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
   def room_params
     params.require(:booking).permit(:check_in,:check_out)
   end
end
