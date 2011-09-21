class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

  def new
	  @user = User.new

		respond_to do |format|
			format.html
			format.xml  { render :xml => @user }
		end
  end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Welcome, #{@user.name}"
			redirect_to @user
		else
			render 'new'
		end
	end
end
