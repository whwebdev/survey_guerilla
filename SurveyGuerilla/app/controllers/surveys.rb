
# # GET /cats            index   show a list of cats
get '/surveys' do
  check_logged_in
  @surveys = Survey.all
  erb :survey_list
end

# # GET /cats/new        new     show the form to create a new cat
# get '/surveys/new' do

# end

# # POST /cats           create  create a new cat
# post '/surveys' do

# end

# # GET /cats/:id/edit   edit    show the form to edit an existing cat
get '/surveys/:id/edit' do
  @survey = Survey.find(:id)

end

# # GET /cats/:id        show    show an individual cat
get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

# POST /cats/:id        save a new cat
post '/surveys/:id' do
  session[:user_id] = User.first
  params[:post].values.each do |answer|
    User.find(session[:user_id]).chosen_answers << Answer.find(answer)
  end
end

# # PUT /cats/:id        update  change the properties of an existing cat
# put '/surveys/:id' do

# end

# # DELETE /cats/:id     delete  delete an existing cat
# delete 'surveys/:id' do

# end


