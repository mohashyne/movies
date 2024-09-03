class ApplicationController < ActionController::Base
     
    private

    def current_user
        # this will only run if session has the user_id else it will return nil 
        # and run an exception
              User.find(session[:user_id]) if session[:user_id]
        end

        # to make the current_user method available to all view helpers
        helper_method :current_user
 

        def require_signin
            redirect_to new_session_url, alert: "Please sign in first!" unless current_user
           end
end
