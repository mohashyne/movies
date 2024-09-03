class SessionsController < ApplicationController
    
    def new

    end



    def create
#    params[:email]
#    params[:password]


 # Find the user by their email address provided in the form parameters
 user = User.find_by(email: params[:email])
  
 # Check if the user exists and if the provided password is correct
 if user && user.authenticate(params[:password])
   # If authentication is successful, store the user ID in the session
   session[:user_id] = user.id
   
# Redirect to the intended URL stored in the session, or to the user's profile if no intended URL exists
# After redirection, clear the intended URL from the session
   redirect_to (session[:intended_url] || user),
            notice: "Welcome back, #{user.name}!"
   session[:intended_url] = nil
 else
   # If authentication fails, set an alert message to be displayed on the current page
   flash.now[:alert] = "Invalid email/password combination!"
   
   # Render the sign-in form again with a status indicating that the request was unprocessable
   render :new, status: :unprocessable_entity
   end
    end




    def destroy
        session[:user_id] = nil
        redirect_to movies_url, status: :see_other, notice: "You're now signed out!"
      end
      
end
