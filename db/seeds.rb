require "rest-client"

User.destroy_all
Player.destroy_all
Team.destroy_all

User.create(name: 'Jack', email: 'email@mail.com', password: 'password')
User.create(name: 'Kenny', email: 'kenny@gmail.com', password: 'asdfasdf')



teams = RestClient.get("https://data.nba.net//data/10s/prod/v1/2020/teams.json")
teams_array = JSON.parse(teams)
teams_array["league"]["standard"].uniq.each do |team|
    if team["teamId"] == ("1610616834")
        puts "not today sucker"
    elsif team["teamId"] == ("1610616833") 
        puts "not today buddy"
    else
        Team.create(id: team["teamId"], team_name: team["fullName"], tricode: team["tricode"], conf_name: team["confName"])
    end

end

players = RestClient.get("https://data.nba.net//data/10s/prod/v1/2020/players.json")
players_array = JSON.parse(players)
players_array["league"]["standard"].uniq.each do |player|
    if player["teamId"].empty?
        puts "not today"
    else
        feetInch = "#{player['heightFeet']}'#{player['heightInches']}"
        full_name = "#{player["firstName"]} #{player["lastName"]}"
        # puts full_name
        Player.create(id: player["personId"], team_id: player["teamId"], player_name: full_name, height: feetInch, position: player['pos'], weight: player['weightPounds'], college: player['collegeName'], country: player['country'], pro: player['yearsPro'])
        newPlayer = Player.find(player['personId'])
        newPlayer.teamName = newPlayer.team.team_name
        newPlayer.save
    end
end


[1629091, 1630268, 1630492, 1630237].each do |id|
    person = Player.find(id)
    person.destroy
end



# binding.pry