class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        set_user_id
      end


  def edit
    set_user_id
  end


  def update
    #  we need the movies id again , because instance variable
    # donot live on after the action runs, thats why we called it here
    # again despite calling it on edit.
    set_user_id
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
            set_user_id
            @user.destroy
            session[:user_id] = nil
            redirect_to  users_url, status: :see_other,  
            alert: "User was successfully destroyed."
        end



          private
     
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