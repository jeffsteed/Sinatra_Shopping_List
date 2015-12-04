class AccountController < ApplicationController

  get "/" do
    erb :home
  end

  get "/register" do
    erb :register
  end

  post "/register" do
    p params #Debugging helper
    #Check to see if the user already exists.
    if does_user_exist(params[:user_name]) == true
      @message = "Uh Oh! This user already exists."
      return erb :message
    end
    #If the user doesn't already exist, create it.
    new_user = Account.create(user_name: params[:user_name], user_email: params[:user_email], password: params[:password])

    p new_user #Debugging helper

    #Create session for user
    session[:current_user] = new_user

    @message = "You succesfully registered!"
    erb :message
  end

  get "/login" do
    erb :login
  end

  post "/login" do
    if does_user_exist(params[:user_name])
      user = Account.authenticate(params[:user_name], params[:password])
    else
      @message = "Your password or username is incorrect."
      erb :login
    end
    if user
      session[:current_user] = user
      @message = "Welcome back, " + params[:user_name]
      erb :home
    else
      @message = "Your password or username is incorrect."
      erb :login
    end

  end

  get "/logout" do
    authorization_check
    session[:current_user] = nil
    redirect "/"
  end

end
