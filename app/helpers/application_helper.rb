module ApplicationHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def restaurant_present_and_set
        params[:restaurant_id] && @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    end
end
