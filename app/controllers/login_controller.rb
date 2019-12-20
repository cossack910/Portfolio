class LoginController < ApplicationController
    def index
    end

    def create
        user = User.find_by(mail: params[:session][:mail].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to "/tops"
        else   
            flash[:danger] = 'Invailed mail/password combination' 
            render 'index'
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end

end
