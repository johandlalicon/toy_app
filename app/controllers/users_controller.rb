class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        puts "Params received: #{user_params.inspect}"
        if @user.save
            redirect_to @user
            flash[:success] = 'User was successfully registered.'
          else
            render :new, status: :unprocessable_entity
          end
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :email)
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user == current_user
    end

end
