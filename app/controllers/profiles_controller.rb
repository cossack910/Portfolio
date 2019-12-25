class ProfilesController < ApplicationController
    def index
        @reviews =  Review.joins("INNER JOIN gadgets ON gadgets.id = reviews.gadget_id").select("gadgets.gadget_name ,reviews.*").where(reviews: {user_id: current_user.id}).order(id: "DESC")    
    end

    def edit_profile
        @user = User.find(current_user.id)
    end

    def update
        User.find(current_user.id).update(profile_update_params)
        redirect_to profiles_path 
    end

    private
    def profile_update_params
        params.require(:user).permit(:user_name, :birthday, :gender, :mail, :mail_sub, :user_image)
    end
end
