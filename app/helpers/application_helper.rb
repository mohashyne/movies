module ApplicationHelper
    def current_user
# this will only run if session has the user_id else it will return nil 
# and run an exception
      User.find(session[:user_id]) if session[:user_id]
    end
end
