class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
      # format.js
      # { render :layout => false }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
    # params.require(:article).permit(:title, :body)

  end

end
