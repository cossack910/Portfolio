class EmpathiesController < ApplicationController
    before_action :set_review
    
    def create
        Empathy.create(review_id: @review.id,user_id: current_user.id )
    end

    def delete
        @empathies = Empathy.find_by(review_id: @review.id, user_id: current_user.id) 
        @empathies.destroy       
    end

    private
    def set_review
        @review = Review.find(params[:review_id])
    end
end
