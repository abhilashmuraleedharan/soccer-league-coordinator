/* The objective of this project is to divide 18 children who have signed up for the league into three even teams
 * 1. Dragons
 * 2. Sharks
 * 3. Raptors
 */

/*
 * Part 1
 * a) Store the information of all league players
 * b) Display all the players' information
 */
// Use an array of dictionary [[String: Any]] to hold all player's information.
let leaguePlayersList = [
                         ["name":"Joe Smith",
                          "height":42.0,
                          "experience":true,
                          "guardian":"Jim and Jan Smith"
                         ],
                         ["name":"Jill Tanner",
                          "height":36.0,
                          "experience":true,
                          "guardian":"Clara Tanner"
                         ],
                         ["name":"Bill Bon",
                          "height":43.0,
                          "experience":true,
                          "guardian":"Sara and Jenny Bon"
                         ],
                         ["name":"Eva Gordon",
                          "height":45.0,
                          "experience":false,
                          "guardian":"Wendy and Mike Gordon"
                         ],
                         ["name":"Matt Gill",
                          "height":40.0,
                          "experience":false,
                          "guardian":"Charles and Sylvia Gill"
                         ],
                         ["name":"Kimmy Stein",
                          "height":41.0,
                          "experience":false,
                          "guardian":"Bill and Hillary Stein"
                         ],
                         ["name":"Sammy Adams",
                          "height":45.0,
                          "experience":false,
                          "guardian":"Jeff Adams"
                         ],
                         ["name":"Karl Saygan",
                          "height":42.0,
                          "experience":true,
                          "guardian":"Heather Bledsoe"
                         ],
                         ["name":"Suzane Greenberg",
                          "height":44.0,
                          "experience":true,
                          "guardian":"Henrietta Dumas"
                         ],
                         ["name":"Sal Dali",
                          "height":41.0,
                          "experience":false,
                          "guardian":"Gala Dali"
                         ],
                         ["name":"Joe Kavalier",
                          "height":39.0,
                          "experience":false,
                          "guardian":"Sam and Elaine Kavalier"
                         ],
                         ["name":"Ben Finkelstein",
                          "height":44.0,
                          "experience":false,
                          "guardian":"Aaron and Jill Finkelstein"
                         ],
                         ["name":"Diego Soto",
                          "height":41.0,
                          "experience":true,
                          "guardian":"Robin and Sarika Soto"
                         ],
                         ["name":"Chloe Alaska",
                          "height":47.0,
                          "experience":false,
                          "guardian":"David and Jamie Alaska"
                         ],
                         ["name":"Arnold Willis",
                          "height":43.0,
                          "experience":false,
                          "guardian":"Claire Willis"
                         ],
                         ["name":"Phillip Helm",
                          "height":44.0,
                          "experience":true,
                          "guardian":"Thomas Helm and Eva Jones"
                         ],
                         ["name":"Les Clay",
                          "height":42.0,
                          "experience":true,
                          "guardian":"Wynonna Brown"
                         ],
                         ["name":"Herschel Krustofski",
                          "height":45.0,
                          "experience":true,
                          "guardian":"Hyman and Rachel Krustofski"
                         ]
                        ]

// Function to print to console player details in a collection
func displayPlayerDetails(inCollection list: [[String: Any]]) {
    for player in list {
        print("") // To put a blank line
        for (detail, detailValue) in player {
            print("\(detail): \(detailValue)")
        }
    }
}

// Test the displayPlayerDetails function by displaying information of all players in the league
print("Listing below the details of all players in the league")
print("------------------------------------------------------")
displayPlayerDetails(inCollection: leaguePlayersList)
print("")

/*
 * Part 2
 * a) Create each team collections
 * b) Create a collection to hold teams
 * c) Put all experienced players in an array
 * d) Put all inexperienced players in another array
 * e) To have same average height across teams,
 *       1) Sort experienced players array in ascending order of their heights
 *       2) Sort inexperienced players array in descending order of their heights
 * f) Distribute across the teams, players from the sorted experiened and
 *    unexperienced players list in such a way that it satisfies the following conditions
 *    1. Ratio of experienced to inexperienced players across teams should be same
 *    2. Average Height difference between teams shouldn't exceed more than 1.5 inches
 */

// Declare necessary collections
var experiencedLeaguePlayers = [[String: Any]]()
var inExperiencedLeaguePlayers = [[String: Any]]()
var teamDragons = [[String: Any]]()
var teamSharks = [[String: Any]]()
var teamRaptors = [[String: Any]]()
var leagueTeams = [teamDragons, teamSharks, teamRaptors]
let totalTeams = 3

// Put all experienced and inexperienced players in respective arrays
for player in leaguePlayersList {
    if (player["experience"] as! Bool == true) {
        experiencedLeaguePlayers.append(player)
    } else {
        inExperiencedLeaguePlayers.append(player)
    }
}

// Sort experiencedLeaguePlayers in ascending order based on their heights and store the sorted array to a new collection
let incHeightSortedExperiencedPlayers = experiencedLeaguePlayers.sorted{ ($0["height"] as! Double) < ($1["height"] as! Double) }

// Sort inExperiencedLeaguePlayers in decending order based on their height and store the sorted array to a new collection
let decHeightSortedInExperiencedPlayers = inExperiencedLeaguePlayers.sorted{ ($0["height"] as! Double) > ($1["height"] as! Double) }

// Distribute the players in a balanced manner across the teams present in the leagueTeams Collection
let playersPerTeam = leaguePlayersList.count/totalTeams
var j: Int
for i in 0..<totalTeams {
    j = i
    for _ in 1...(playersPerTeam/2) { // Since 2 players are added in every iteration
       leagueTeams[i].append(incHeightSortedExperiencedPlayers[j])
       leagueTeams[i].append(decHeightSortedInExperiencedPlayers[j])
       j += totalTeams
    }
}

// Assign the populated team values from the leagueTeams collection to their respective team vars
teamDragons = leagueTeams[0]
teamSharks = leagueTeams[1]
teamRaptors = leagueTeams[2]

print("Team Dragons players are")
print("------------------------------")
displayPlayerDetails(inCollection: teamDragons)
print("")

print("Team Sharks players are")
print("------------------------------")
displayPlayerDetails(inCollection: teamSharks)
print("")

print("Team Raptors players are")
print("------------------------------")
displayPlayerDetails(inCollection: teamRaptors)
print("")

