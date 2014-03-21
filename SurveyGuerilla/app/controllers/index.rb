enable :sessions

get '/' do
  erb :index
end

#------- Users -----------

# GET /cats/new        new     show the form to create a new cat
get '/users/login' do

end

# POST /cats           create  create a new cat
post '/users' do

end

# GET /cats/:id        show    show a user and
get '/users/:id' do

end

#-------- Answering Surveys -----

#Post /answers(kinda)   Creating new answers to questions
Post '/survey/:id/submit' do

end
#Get /answers (kinda)   listing(but really counting) answers to questions (by survey)
Get '/survey/:id/results' do

end
