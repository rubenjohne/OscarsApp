class PrizesController < ApplicationController
  before_filter :signed_in_user
  active_scaffold :"prize" do |conf|
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end

