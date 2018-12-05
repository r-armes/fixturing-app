require 'round_robin_tournament'
require 'colorize'
require 'chronic'

hawthorn_hawks = {
  name: "Hawthorn Hawks",
  location: "2A Stadium Circuit, Mulgrave VIC 3170"
}
stkilda_saints = {
  name: "St.Kilda Saints",
  location: "32/60 Linton St, Moorabbin VIC 3189"
}
melbourne_demons = {
  name: "Melbourne Demons",
  location: "Gosch Paddock Olympic Blvd, Melbourne VIC 3004"
}
richmond_tigers = {
  name: "Richmond Tigers",
  location: "Yarra Park, Punt Rd, Richmond VIC 3121"
}
carlton_blues = {
  name: "Carlton Blues",
  location: "Ikon Park, Royal Parade, Carlton North VIC 3054"
}
collingwood_magpies = {
  name: "Collingwood Magpies",
  location: "Olympic Blvd, Melbourne VIC 3000"
}
goldcoast_suns = {
  name: "Goldcoast Suns",
  location: "Nerang Broadbeach Rd, Carrara QLD 4211"
}
sydney_swans = {
  name: "Sydney Swans",
  location: "31/33 Aughtie Dr, Albert Park VIC 3206"
}
gws_giants = {
  name: "GWS Giants",
  location: "Grand Parade, Olympic Park NSW 2127"
}
west_coast_eagles = {
  name: "West Coast Eagles",
  location: "400 Royal Parade, Princes Hill VIC 3054"
}
geelong_cats = {
  name: "Geelong Cats",
  location: "Kardinia Park, 1 Carr St, Geelong VIC 3220"
}
north_melbourne_kangaroos = {
  name: "North Melbourne Kangaroos",
  location: "204-206 Arden St, North Melbourne VIC 3051"
}
port_adelaide_power = {
  name: "Port Adelaide Power",
  location: "Brougham Pl, Alberton SA 5014"
}
essendon_bombers = {
  name: "Essendon Bombers",
  location: "275 Melrose Dr, Melbourne Airport VIC 3045"
}
adelaide_crows = {
  name: "Adelaide Crows",
  location: "757 Bourke St, Docklands VIC 3008"
}
western_bulldogs = {
  name: "Western Bulldogs",
  location: "417 Barkly St, Footscray VIC 3011"
}
fremantle_dockers = {
  name: "Fremantle Dockers",
  location: "31 Veterans Parade, Cockburn Central WA 6164"
}
brisbane_lions = {
  name: "Brisbane Lions",
  location: "Vulture St, Woolloongabba QLD 4102"
}

teams = [
  melbourne_demons,
  richmond_tigers,
  carlton_blues,
  collingwood_magpies,
  goldcoast_suns,
  sydney_swans,
  gws_giants,
  west_coast_eagles,
  geelong_cats,
  north_melbourne_kangaroos,
  port_adelaide_power,
  essendon_bombers,
  adelaide_crows,
  western_bulldogs,
  fremantle_dockers,
  brisbane_lions
]

#----------- uses round_robin_tournament gem to schedule matches between teams(each team verses eachother once) added .shuffle  to the array so that the scheduling is randomized each time ---------------
rounds = RoundRobinTournament.schedule(teams.shuffle)

#-------input an array of teams and it will create a whole fixture of rounds based on that, each rounds start date is one week apart; allocating one game on friday at 7pm and splitting the rest of the games between sat and sun (with a 1hr difference between games for the day), the first team in the array for that game will be allocated the home team(highlighted in green) and the location will be corresponding to that team) and the away team will be highlighted in red. It also uses the chronic gem to allocated the dates with the "days from" string (setting the start date as the initial day <used the official first day of the afl season>)------------
def create_fixture(array) 
  fixture = []
  array.each_with_index do |round, i|
    round_data = []
    puts """==================== Round #{i+1} ====================
 """.colorize(:cyan)
    games_split = (round.length) / 2
    date = i*7
    round.each_with_index do |game, i|
      
      home_team = game[0]
      away_team = game[1]
      if i == 0
        day = "#{date} days from march 21"
        time = 7
     elsif (i > 0 && i < (games_split + 1))
        day = "#{date+1} days from march 21"
        time = 1 + (i % (games_split + 1))
      else
        day = "#{date+2} days from march 21"
        time = 1 + (i % (games_split))
      end
      
      game_data = """-------------------- Game #{i+1} --------------------
      #{home_team[:name].colorize(:green)} vs 
      #{away_team[:name].colorize(:red)}
      Date: #{Chronic.parse(day).strftime('%d %b %Y')}
      Time: #{time}:00pm
      Location: #{home_team[:location]}
      """
      puts game_data
      round_data<<game_data
    end
    fixture<<round_data
  end
  return fixture
end

fixture1 = create_fixture(rounds)

#--------------- to check all the games for a certain round ------------
#--------------- need to input the fixture that has been created and the round number (integer) ------------

def check_round(fixture, round_number)
  fixture.each_with_index do |round, i|
    if ((i+1) == round_number)
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts """==================== Round #{round_number} ==================== 
      """.colorize(:cyan)
      fixture[round_number -1].each do |game|
        puts game
      end
    else
    end
  end
end

check_round(fixture1, 3)

#--------------- to check a specific teams game for a certain round ------------
#--------------- need to input the fixture, which round number (integer), and the team name (case sensitive) -----

def check_game(fixture, round_number, team_name)
  fixture.each_with_index do |round, i|
    if ((i+1) == round_number)
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
      puts """==================== Round #{round_number} ==================== 
      """.colorize(:cyan)
      fixture[round_number -1].each do |game|
        if game.include? team_name
        puts game
        else
        end
      end
    end
  end
end

check_game(fixture1, 3, "Melbourne Demons")


# ----------------------------------------- to schedule individual game (doesn't relate to above methods)-------------------------------

def schedule_game(home_team, away_team, date_time)
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  puts """
  #{home_team[:name].colorize(:green)} vs 
  #{away_team[:name].colorize(:red)}
  Date/Time: #{Chronic.parse(date_time).strftime('%A, %d %b %Y %l:%M %p')}
  Location: #{home_team[:location]}
  """

end

schedule_game(melbourne_demons, carlton_blues, "21st March at 12pm")