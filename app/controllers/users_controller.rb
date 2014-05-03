class UsersController < ApplicationController

  def index
  	@users = User.all
  end
  def show
  		@user = User.find(params[:id])
	end

  def edit
  	 @user = User.find(params[:id])

  end
	def update
  @user = User.find(params[:id])
 
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'
  end
end
  def new
  	@user = User.new
  end
 def create
  	@user = User.new( user_params )
  	 if @user.save
    		redirect_to 'index'
  		else
    		render 'new'
  		end
end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def user_params
	  params.require(:user).permit(:avatar)
	end


end
