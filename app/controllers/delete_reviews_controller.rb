class DeleteReviewsController < ApplicationController
    after_action :update_review 
    def update
        Review.find(params[:id]).update(delete_flag: 1)
    end

    private
    def update_review
        @review = Review.where(user_id: current_user.id)
    end
end
