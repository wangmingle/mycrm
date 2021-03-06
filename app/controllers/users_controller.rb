class UsersController < ApplicationController
	
	def index
		@users = User.all

		respond_to do |format|
			format.html
			format.json { render json: @users }
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


end