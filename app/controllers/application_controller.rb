class ApplicationController < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, "*" 
    set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
    set :expose_headers, ['Content-Type']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  # method "URL" do
    
  # end

  get "/teams" do
    Team.all.to_json
  end

  get "/players" do
    Player.all.to_json
  end

  post "/signup" do
    signup_params = params.select{|k,v| ["name", "email", "password"].include?(k)}

    if User.where(email: params[:email]).exists?
      signup = false
      signup.to_json
    else
      new_user = User.create(signup_params)
      new_user.to_json
    end
  end

  post "/login" do
    user = User.where(email: params[:email], password: params[:password])
    if user.exists?
      user.to_json
    else
      invalid_login = {error: "Invalid email or password", status: false}
      invalid_login.to_json
    end
    # binding.pry
  end

  post "/myteam" do
    myTeam_params = params.select{|k,v| ["team_id", "user_id"].include?(k)}

  end

  #   binding.pry
end
