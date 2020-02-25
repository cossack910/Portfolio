class ReviewsController < ApplicationController
require 'bigdecimal'
    def index
        key = params[:id]
        @gadget = Gadget.find(key)
        @reviews = Review.joins("INNER JOIN users ON users.id = reviews.user_id").select("users.user_name ,users.user_image, users.id AS ID, reviews.*").where(reviews: { gadget_id: key})
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
            review_point = Review.order(created_at: :desc).limit(1)
            #pythonスクリプトreview_pointを動かしてレビューの得点を出す
            p_point = `python lib/assets/python/review_point.py`
            review_point.update(review_point: p_point)

            avg = Review.where(gadget_id: gadget_id).where(delete_flag: 0).where.not(review_point: 0).average(:review_point)
            #pythonスクリプトbayes_readを動かしてそれぞれの項目の得点を出す。
            data = `python lib/assets/python/bayes_read.py "#{gadget_id}"`
            #それぞれの項目数値を配列に分ける。
            data = data.split(" ")
            rev_avg = (BigDecimal(avg) + BigDecimal(data[0]) + BigDecimal(data[1]) + BigDecimal(data[2]) + BigDecimal(data[3]))/5
            Gadget.where(id: gadget_id).update(review_point: rev_avg, performance_point: data[0], design_point: data[1], costperformance_point: data[2], feel_point: data[3])
        end
        redirect_to reviews_path(id: gadget_id)
    end

    private
    def review_add_params
        params.require(:review).permit(:good_review, :bad_review, :user_id, :gadget_id, :image, :delete_flag)
    end

end
