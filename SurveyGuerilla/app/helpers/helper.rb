helpers do
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_logged_in
    redirect to '/' unless session[:user_id]
  end
end


