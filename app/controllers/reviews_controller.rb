class ReviewsController < ApplicationController
    def new
      @room=Room.find(params[:room_id])
      @user=current_user
      @review=Review.new
    end
    def create
      @room=Room.find(params[:room_id])
      @user=current_user
      review=Review.new(review_params)
      @booking=@room.find_booking(@user)
      review.booking=@booking
      review.review_date=Date.today
      review.save
      flash[:success] = "Review was created successfully"
      redirect_to room_user_reviews_path(@room,@user)
    end
    def index
      @room=Room.find(params[:room_id])
      @user=current_user
      @reviews = Review.all
    end
    def show
     @room=Room.find(params[:room_id])
     @user=current_user
     id = params[:id]
     @review = Review.find(id)
    end
    def destroy
     @room=Room.find(params[:room_id])
     @user=current_user 
     id = params[:id]
     @review = Review.find(id)
     @review.destroy
     flash[:success] = 'Review was deleted successfully'
     redirect_to room_user_reviews_path(@room,@user)
    end
    def update
     @room=Room.find(params[:room_id])
     @user=current_user 
     id = params[:id]
     @review = Review.find(id)
     @review.update!(review_params)
     @review.review_date=Date.today
     @review.save
     flash[:success] = 'Review was updated successfully'
     redirect_to room_user_review_path(@room,@user,@review)
    end
   def edit
     @room=Room.find(params[:room_id])
     @user=current_user
     id = params[:id]
     @review = Review.find(id)
   end
   private
   def review_params
     params.require(:review).permit(:title,:stars,:description)
   end
end
