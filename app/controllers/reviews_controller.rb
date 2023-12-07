class ReviewsController < ApplicationController
    def create
        @review = Review.new(review_params)
        @task = Task.find(params[:task_id])
        @review.task = @task
        if @review.save
          redirect_to task_path(@task)
        else
        #   @bookmark = Bookmark.new
          render "tasks/show", status: :unprocessable_entity
        end
      end
    
      def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to task_path(@review.task)
      end
    
      private
    
      def review_params
        params.require(:review).permit(:comment, :rating)
      end
    end
