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
    # new_user = User.create(signup_params)
    # new_user.to_json
    if User.where(email: params[:email]).exists?
      signup = false
      signup.to_json
    else
      new_user = User.create(signup_params)
      new_user.to_json
    end
    # binding.pry
    # params.to_json
    # binding.pry
  end
  #   binding.pry
end
