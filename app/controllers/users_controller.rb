class UsersController < ApplicationController


  get '/login' do
      if logged_in?
        redirect "/"
      else
       erb :'users/login'
      end
  end

  post '/login' do
  user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome back #{current_user.username}!"
      redirect "/users/#{user.id}"
      #OR redirect to home page.(we need to decided later)
      #NEED to add seccessful logged in message
    else
      #NEED to add login error message
      redirect '/login'
    end
  end

  get '/users/:id' do

    @user = User.find_by_id(params[:id])

    if logged_in? && @user == current_user
      erb :'/users/show'
    else
      redirect '/login'
    end

  end

  get '/workout' do

    erb :'/users/workout'

  end

  post '/workout' do
    @b_part =  Type.all.detect{|x| x.name == params[:body_part]}
    redirect :"/workout/#{params[:body_part].downcase}"

  end

  get '/workout/:slug' do
    @user = current_user
    @b_part =  Type.all.detect{|x| x.name.downcase == params[:slug]}
    array = @b_part.exercises.sample(2)
    @exercise_1 = array[0]
    @exercise_2 = array[1]

    @set_1 = rand(3..5)
    @set_2 = rand(3..5)
    @rep_1 = [8,10,12].sample
    @rep_2 = [8,10,12].sample
    erb :'/users/workout_now'
  end

  get '/signup' do
    if logged_in?
      redirect '/'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    user = User.new(params)
    if user.save && (user.username != '') && (user.email != '')
      session[:user_id] = user.id
      flash[:message] = "Thanks for signing up!"
      # user.makedir
      redirect '/'
      #NEED to add seccessful created user message
    else
      #NEED to add error message
      redirect '/signup'
    end
  end

  get '/signout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end


end
