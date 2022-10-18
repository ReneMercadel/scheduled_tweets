class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # render plain: params[:user]
    # HOWEVER! to get the above line to render the user obj text properly I need to this attr "data: { turbo:false}," to the form element on line 3 in new.html.erb
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end