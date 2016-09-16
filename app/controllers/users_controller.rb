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
    @user = current_user
    @b_part =  Type.all.detect{|x| x.name.downcase == params[:body_part]}
    @exercise_1 = nil
    @exercise_2 = nil
    @b_part.exercises.sample(2).each do |wo|
      if @exercise_1 == nil
        @exercise_1 = wo
      else
        @exercise_2 = wo
      end
    end
    @set_1 = [3,4,5].sample
    @set_2 = [3,4,5].sample
    @rep_1 = [8,10,12].sample
    @rep_2 = [8,10,12].sample
    # binding.pry
    erb :'users/workout_now'
  end

  get '/workout/:slug' do
    @b_part =  Type.all.detect{|x| x.name.downcase == params[:slug]}
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
    # binding.pry
    User.all.each do |user|
      if user.username == params[:username] || user.email == params[:email]
        redirect to '/signup'
        #put flash message saying username or email is taken
      end
    end
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

  get '/users/:exercise/:set/:rep' do
    binding.pry
  end


end
