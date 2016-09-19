

class UsersController < ApplicationController


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


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
    array = @b_part.exercises.sample(2)
    @exercise_1 = array[0]
    @exercise_2 = array[1]
    # binding.pry
    # @b_part.exercises.sample(2).each do |wo|
    #   if @exercise_1 == nil
    #     @exercise_1 = wo
    #   else
    #     @exercise_2 = wo
    #   end
    # end
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
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      #flash message enter something into the fields
      flash[:message] = "You are missing a field."
      redirect to '/signup'
    end
    if params[:email].match(VALID_EMAIL_REGEX) == nil
      #flash message: enter valid email
      redirect to '/signup'
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

  post '/users/:exercise_1/:rep_1/:set_1/:exercise_2/:rep_2/:set_2' do
    @user = current_user
    if params[:exercise_1].class == [].class
      @exercise_1 = Exercise.find_by(id: params[:exercise_1][1])
      @fave_1 = FavoriteWorkout.create(rep: params[:rep_1], set: params[:set_1])
      @fave_1.users << current_user
      @fave_1.exercises << @exercise_1
    end
    if params[:exercise_2].class == [].class
      @exercise_2 = Exercise.find_by(id: params[:exercise_2][1])
      @fave_2 = FavoriteWorkout.create(rep: params[:rep_2], set: params[:set_2])
      @fave_2.users << current_user
      @fave_2.exercises << @exercise_2
    end
    redirect to "/users/#{@user.id}"
  end

  get '/favorites' do
    # binding.pry
    @user = current_user
    erb :'/users/favorite'
  end

  get '/delete/:id' do
    @fave = FavoriteWorkout.find_by(id: params[:id])
    @fave.destroy
    redirect to '/favorites'
    # binding.pry
  end


end
