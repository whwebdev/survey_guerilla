enable :sessions

post '/' do
  @user = User.find_by(username: params[:username])
  @user_id = @user.id if @user
  # @user = User.authenticate(username: params[:username], password: params[:password])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user_id
    redirect to '/surveys'  #to do: redirect to /users/:id (the user 'homepage')
  else
    redirect to '/'
  end
end

post '/new' do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    @user_id = @user.id
    session[:user_id] = @user_id
    redirect to '/surveys'
  else
    redirect to '/'
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end
