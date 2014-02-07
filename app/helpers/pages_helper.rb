module PagesHelper
  
  def sign_up_first
    redirect_to root_path unless signed_up?
  end
  
  def signed_up?
    !session[:participant_id] .nil?
  end
  
end
