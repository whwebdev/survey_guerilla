require 'json'
# # GET /cats            index   show a list of cats
get '/surveys' do
  check_logged_in
  @surveys = Survey.all
  erb :survey_list
end

# # GET /cats/new        new     show the form to create a new cat
get '/surveys/new' do
  check_logged_in
  erb :new_survey
end

# # POST /cats           create  create a new cat
post '/surveys' do
  # p params
  survey = Survey.create(creator_id: session[:user_id], title: params[:survey][:title])
  params[:survey][:questions].each do |question|
    # p question[:options]
    question_object = Question.create(survey_id: survey.id, text: question[:question])
    question[:options].each do |option|
      Answer.create(question_id: question_object.id, text: option)
    end
  end
  current_user
  erb :user_page
end

# # GET /cats/:id/edit   edit    show the form to edit an existing cat
get '/surveys/:id/edit' do
  @survey = Survey.find(:id)

end

# # GET /cats/:id        show    show an individual cat
get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if current_user == @survey.creator_id
    erb :results
  elsif current_user.taken_surveys.include?(@survey)
    erb :results
  else
    session[:current_survey_id] = @survey.id
    erb :survey
  end
end

# POST /cats/:id        save a new cat
post '/surveys/:id' do
  current_user
  user = User.find(session[:user_id])
  @survey = Survey.find(session[:current_survey_id])
  user.taken_surveys << @survey
  params[:post].values.each do |answer_id|
    user.chosen_answers << Answer.find(answer_id)
  end
  erb :results
end

get 'surveys/:id/results' do


end

# # PUT /cats/:id        update  change the properties of an existing cat
# put '/surveys/:id' do

# end

# # DELETE /cats/:id     delete  delete an existing cat
# delete 'surveys/:id' do

# end


