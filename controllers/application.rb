class ApplicationController < Sinatra::Base

  require "bundler"
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :adapter => "postgresql",
    :database => "shop_to_it"
  )

  set :views, File.expand_path("../../views", __FILE__)
  set :public_dir, File.expand_path("../../public", __FILE__)

  not_found do
    erb :page_not_found
  end

  enable :sessions

  # Method to check if a user already exists
  def does_user_exist(username)
    user = Account.find_by(:user_name => username)
    if user
      return true
    else
      return false
    end
  end

  #Is the user already logged in
  def authorization_check()
    if session[:current_user] == nil
      return false
      redirect "/not_authorized"
    else
      return true
    end
  end

end
