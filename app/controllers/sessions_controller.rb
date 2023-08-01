class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
            if user
                log_in user
                redirect_to user
            else
                flash.now[:danger] = "Invalid username/email"
                render :new, status: :unprocessable_entity
        end
    end

    def destroy
        log_out
        redirect_to root_url
        puts current_user
    end
    
end
