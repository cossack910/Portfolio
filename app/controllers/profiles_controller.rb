class ProfilesController < ApplicationController
    def index
        @reviews =  Review.joins("INNER JOIN gadgets ON gadgets.id = reviews.gadget_id").select("gadgets.gadget_name ,reviews.*").where(reviews: {user_id: current_user.id}).order(id: "DESC")    
    end

    def edit
        
    end
end
