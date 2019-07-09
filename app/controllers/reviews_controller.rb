class ReviewsController < ApplicationController
    def new 
    end
    def create
      Review.create(review_params)
      flash[:success] = "Review was created successfully"
      #redirect_to edit_user 
    end
    def index
     @reviews = Review.all
    end
    def show
     id = params[:id]
     @review = Review.find(id)
    end
    def delete
     id = params[:id]
     @review = Review.find(id)
     @review.destroy
     flash[:success] = 'Review was deleted successfully'
     #redirect_to '/dogs/index'
    end
    def update
     id = params[:id]
     @review = Reviews.find(id)
     @review.update(review_params)
     flash[:success] = 'Review was updated successfully'
     #redirect_to dog_edit_path(@dog)
   end
   def edit
     id = params[:id]
     @user = Review.find(id)
   end
   private
   def room_params
     params.require(:review).permit(:title,:stars,:description,:review_date)
   end
end
