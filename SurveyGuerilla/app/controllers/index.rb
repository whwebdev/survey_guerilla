enable :sessions

get '/' do
  if current_user
    redirect to '/surveys'
  else
    erb :index
  end
end

# #------- Users -----------


# # GET /cats/:id        show    show a user and
get '/users/profile' do
  check_logged_in
  current_user
  erb :user_page
end

# #-------- Answering Surveys -----

# #Post /answers(kinda)   Creating new answers to questions
# Post '/survey/:id/submit' do

# end
# #Get /answers (kinda)   listing(but really counting) answers to questions (by survey)
# Get '/survey/:id/results' do

# end
get '/temp/alt_survey' do
  erb :alt_survey_create_form
end
