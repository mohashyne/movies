class UsersController < ApplicationController
  # before_action :require_signin, only: [:index, :show, :edit, :update, :destroy]

  # INSTEAD OF THE ABOVE , WE CAN USE SOMETHING BETTER BELOW:
  # the first action code will require signin for all actions except new and create
  # the second action code will be required to run before the edit , update or destroy
  # method runs

   before_action :require_signin, except: [:new, :create]
   before_action :require_correct_user, only: [:edit, :update, :destroy]

  #  apply this method to all controllers by moving it into the application conttroller
  #  def require_signin
  #   redirect_to new_session_url, alert: "Please sign in first!" unless current_user
  #  end


    def index
        @users = User.all
    end

    def show
        set_user_id
        @registrations = @user.registrations
      end


  def edit
    # set_user_id
  end


  def update
    #  we need the movies id again , because instance variable
    # donot live on after the action runs, thats why we called it here
    # again despite calling it on edit.

    # set_user_id
    if @user.update(user_params)
    #  flash[:notice] = "Event sucessfully updated!"  

    #   redirect_to movie_path(@movie)
    redirect_to @user, notice: "Account sucessfully updated!"  
    else
        render :edit, status: :unprocessable_entity
    end
  end


    def new
        @user = User.new
    end

    def create
            @user = User.new(user_params)
    
         if @user.save
             # log user into session once the user is created
              session[:user_id] = @user.id
            redirect_to @user,
            notice: "Thanks for registering!"
         else
            render :new, status: :unprocessable_entity
         end
    
        end

    
        def destroy
            # set_user_id
            @user.destroy
            session[:user_id] = nil
            redirect_to  users_url, status: :see_other,  
            alert: "User was successfully destroyed."
        end



          private

          def require_correct_user
            # since the "@user = User.find(params[:id])" is requried to run before action
            # we can call it here and use it in the require_correct_user method
            # and also avvoid duplication in other methods above
            @user = User.find(params[:id])
              redirect_to movies_url  unless current_user?(@user)
          end

          # instead of defining this method here , we define it in the application controller to make it available to all controllers
          # def current_user
          #   # this will only run if session has the user_id else it will return nil 
          #   # and run an exception
          #         User.find(session[:user_id]) if session[:user_id]
          #   end
     
          def set_user_id
            @user = User.find(params[:id])
            end
      
          def user_params
              user_params =
                params
                  .require(:user)
                  .permit(
                    :name,
                    :email,
                    :password,
                    :password_confirmation
                  )
            end
          

end