class UserController < ApplicationController
  def index
  	@user = User.all
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
  	@user = User.create( user_params )
  	 if @user.save
    		redirect_to @user
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
