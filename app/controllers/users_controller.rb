class UsersController < ApplicationController

    def create
        user = User.find_by(user_params[:username])
            user = User.create(user_params)
            session[:user_id] = user.id
            render json: user, status: :created
          else
            render json: { error: "Unprocessable" }, status: :unprocessable_entity
          end
        end
    
    private 

    def user_params
        params.permit(:username, :password, :image_url, :bio)
    end

end
