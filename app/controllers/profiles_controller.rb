class ProfilesController < ApplicationController
    def index
        @reviews =  Review.joins("INNER JOIN gadgets ON gadgets.id = reviews.gadget_id").select("gadgets.gadget_name ,reviews.*").where(reviews: {user_id: current_user.id}).order(id: "DESC")    
        @good_sum = Review.joins("INNER JOIN empathies ON empathies.review_id = reviews.id").joins("INNER JOIN users ON users.id = reviews.user_id").select("users.user_name, count(empathies.review_id) num_emp").group("users.user_name").order("num_emp desc").where(reviews: {user_id: current_user.id})
    end

    def edit_profile
        @user = User.find(current_user.id)
    end

    def update
        User.find(current_user.id).update(profile_update_params)
        redirect_to profiles_path 
    end

    def pass
        @user = User.new
    end

    def pass_update
        User.find(current_user.id).update(pass_update_params)
        redirect_to profiles_path 
    end

    private
    def profile_update_params
        params.require(:user).permit(:user_name, :birthday, :gender, :mail, :mail_sub, :user_image)
    end

    def pass_update_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
