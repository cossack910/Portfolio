class ProfilesController < ApplicationController
    def index
        @username = current_user.user_name
        #@reviews =  Gadget.joins(:reviews).select("gadgets.gadget_name ,reviews.*").where(reviews: {user_id: current_user.id}).order(id: "DESC")
        @reviews =  Review.joins("INNER JOIN gadgets ON gadgets.id = reviews.gadget_id").select("gadgets.gadget_name ,reviews.*").where(reviews: {user_id: current_user.id}).order(id: "DESC")    
    end

    def edit
        
    end

    def delete
        reviews = Review.find(params[:id]).delete
        redirect_to profiles_path
    end
end
