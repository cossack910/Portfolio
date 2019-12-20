class AddUsersController < ApplicationController
    
    def index
        @user = User.new
    end

    def confirm
        if request.post? then    
            @user = User.new(user_add_params)
            user = @user
            render :layout => nil
            if user.mail_sub != user.mail || user.password != user.password_confirmation then
                redirect_to '/add_user'
            end
        end      
    end

    def create
        if request.post? then
            User.create(user_add_params)
        end
        redirect_to "/login"
    end

    private
    def user_add_params
        params.require(:user).permit(:user_name, :last_name, :first_name, :gender, :birthday, :mail, :mail_sub, :password, :password_confirmation)
    end

end
