class DeleteReviewsController < ApplicationController
    before_action :update_review 
    
    def update
        Review.find(params[:id]).update(delete_flag: 1)
    end

    private
    def update_review
        @review = Review.find(params[:id])
    end
end
