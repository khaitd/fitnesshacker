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

  post 'workout' do

    @a =  params[:body_part]

     redirect '/users/workout_now'
  end

  get '/workout_page' do
    @user = current_user
    erb :'/users/workout_now'
  end

  post '/workout_page' do

    
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
