class ApplicationController < ActionController::Base
     
    private

    def current_user
        # this will only run if session has the user_id else it will return nil 
        # and run an exception
              User.find(session[:user_id]) if session[:user_id]
        end

        # to make the current_user method available to all view helpers
        helper_method :current_user
 
        def current_user?(user)
         current_user == user
        end
        
        helper_method :current_user?

        def current_user_admin?
          current_user && current_user.admin?
        end

        helper_method :current_user_admin?


        
        def require_signin
            # Store the current URL in the session so the user can be redirected back after signing in
            session[:intended_url] = request.url
            
            # Check if there is a current user (i.e., the user is signed in)
            # If not, redirect them to the sign-in page with an alert message
            redirect_to new_session_url, alert: "Please sign in first!"  unless current_user
          end
      


      def require_admin
       redirect_to movies_url, alert: "Unauthorized access!" unless current_user.admin?
      end

end
