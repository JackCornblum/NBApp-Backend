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

  get "/myteam" do
    MyTeam.all.to_json
  end

  post "/myteam" do
    user_team_id = params[:user_team_id]
    myTeam_params = params.select{|k,v| ["user_team_id", "player_id"].include?(k)}
    if params[:user_team_id] == ""
      status = false
      status.to_json
    else
      newPlayer = MyTeam.create(myTeam_params)
      my_team = UserTeam.find(user_team_id).my_teams
      ids = my_team.map {|p| p[:player_id]}
      players = ids.map {|id| Player.find(id)}
      players.to_json
    end
  end

  get "/userteam" do
    UserTeam.all.to_json
  end

  post "/userteam" do
    user = params[:user_id]
    user_team_params = params.select{|k,v| ["team_name", "user_id"].include?(k)}
    if UserTeam.exists?(user_id: user)
      status = false
      status.to_json
    else
      new_team = UserTeam.create(user_team_params)
      new_team.to_json
    end
  end

  post "/getuserteam" do
    user_id = params[:user_id]
    my_team = UserTeam.find_by_user_id(user_id).my_teams
    ids = my_team.map {|p| p[:player_id]}
    players = ids.map {|id| Player.find(id)}
    players.to_json
    
  end

  #   binding.pry
end
