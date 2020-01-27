class ReviewsController < ApplicationController

    def index
        key = params[:id]
        @gadget = Gadget.find(key)
        @reviews = Review.joins("INNER JOIN users ON users.id = reviews.user_id").select("users.user_name ,users.user_image, users.id AS ID, reviews.*").where(reviews: { gadget_id: key})
        @test = @reviews.empty? 
        our_input_text = " heart"
        @heart = `python lib/assets/python/heart.py "#{our_input_text}"`
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
        @add_point = `python lib/assets/python/review_point.py`
        redirect_to reviews_path(id: gadget_id)
    end

    private
    def review_add_params
        params.require(:review).permit(:good_review, :bad_review, :user_id, :gadget_id, :image, :delete_flag)
    end

end
