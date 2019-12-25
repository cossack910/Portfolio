class ReviewsController < ApplicationController
  
    def index
        key = params[:id]
        @gadget = Gadget.find(key)
        @reviews = Review.joins("INNER JOIN users ON users.id = reviews.user_id").select("users.user_name , reviews.*").where(reviews: { gadget_id: key})
        @test = @reviews.empty? 
    end

    def add_review
        @review = Review.new
        @gadget_id = params[:id]
    end

    def create
        if request.post? then
            gadget_id = params[:id]
            Review.create(review_add_params)
        end
        redirect_to reviews_path(id: gadget_id)
    end

    private
    def review_add_params
        params.require(:review).permit(:good_review, :bad_review, :user_id, :gadget_id, :image, :delete_flag)
    end

end
