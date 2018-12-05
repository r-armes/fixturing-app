require 'chronic'
require 'colorize'

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

def schedule_game(home_team, away_team, date_time)
  puts """
  #{home_team[:name].colorize(:green)} vs 
  #{away_team[:name].colorize(:red)}
  Date/Time: #{Chronic.parse(date_time).strftime('%A, %d %b %Y %l:%M %p')}
  Location: #{home_team[:location]}
  """

end

schedule_game(melbourne_demons, carlton_blues, "21st March at 12pm")