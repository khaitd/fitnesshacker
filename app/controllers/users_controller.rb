class UsersController < ApplicationController


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  ARRAY = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturady", "sunday"]

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

  post '/users/:id' do
    @user = User.find_by_id(params[:id])
    @exercise_1 = Exercise.find_by(name: params[:fav_1])
    @exercise_2 = Exercise.find_by(name: params[:fav_2])
    ex1 = params[:ex1].split(" ")
    @log1 = Log.create(name: ex1[0], set: ex1[1], rep: ex1[2])
    ex2 = params[:ex2].split(" ")
    @log2 = Log.create(name: ex2[0], set: ex2[1], rep: ex2[2])
    @user.logs.push(@log1, @log2)

    if(params[:fav_1] != nil)
      @fav_1 = FavoriteWorkout.find_or_create_by(set: ex1[1], rep: ex1[2])
      @fav_1.users << current_user
      @fav_1.exercises << @exercise_1
    end

    if(params[:fav_2] != nil)
      @fav_2 = FavoriteWorkout.find_or_create_by(set: ex2[1], rep: ex2[2])
      @fav_2.users << current_user
      @fav_2.exercises << @exercise_2
    end
    # binding.pry

    redirect "/users/#{params[:id]}"
  end


  get '/workout' do

    erb :'/users/workout'

  end

  post '/workout' do

    @b_part =  Type.all.detect{|x| x.name == params[:body_part]}
    redirect "/workout/#{params[:body_part].downcase}"
    @user = current_user
    @b_part =  Type.all.detect{|x| x.name.downcase == params[:body_part]}
    array = @b_part.exercises.sample(2)
    @exercise_1 = array[0]
    @exercise_2 = array[1]
    @set_1 = [3,4,5].sample
    @set_2 = [3,4,5].sample
    @rep_1 = [8,10,12].sample
    @rep_2 = [8,10,12].sample
    erb :'users/workout_now'

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
      flash[:message] = "Something went wrong!"
      redirect '/signup'
    end
  end

  get '/signout' do
    if logged_in?
      session.clear
      flash[:message] = "Successfully Logged Out"
      redirect '/'
    else
      flash[:message] = "Something went wrong"
      redirect '/'
    end
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

 get '/schedule' do
   erb :'/users/schedule'
 end


 post '/schedule' do
   @day_array = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]

   @frequency = params[:frequency].to_i
   @workout_days = @day_array.sample(@frequency)
   @type = Type.all.sample(@frequency)

   erb :'/users/show_schedule'
 end
end
