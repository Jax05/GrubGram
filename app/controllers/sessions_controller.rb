class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:user][:email])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to "/"
    end

    def omniauth
        user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid]) do |u|
            u.username = request.env['omniauth.auth'][:info][:first_name]
            u.email = request.env['omniauth.auth'][:info][:email]
            u.password = SecureRandom.hex(15)
        end

        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path
        end
    end

end