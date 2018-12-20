/* The objective of this project is to divide 18 children who have signed up for the league into three even teams
 * 1. Dragons
 * 2. Sharks
 * 3. Raptors
 * wherein every team has equal balance of experienced and inexperienced players
 * Bonus points if every team has more or less same average players' height
 */

/*
 * Part 1
 * a) Store the information of all league players
 * b) Display all the players' information
 */

// Use a dictionary [String:Any] to hold all details of a player.
let player1:[String: Any] = ["name":"Joe Smith",
                             "height":42.0,
                             "experience":true,
                             "guardian":"Jim and Jan Smith"
                            ]
let player2:[String: Any] = ["name":"Jill Tanner",
                             "height":36.0,
                             "experience":true,
                             "guardian":"Clara Tanner"
                            ]
let player3:[String: Any] = ["name":"Bill Bon",
                             "height":43.0,
                             "experience":true,
                             "guardian":"Sara and Jenny Bon"
                            ]
let player4:[String: Any] = ["name":"Eva Gordon",
                             "height":45.0,
                             "experience":false,
                             "guardian":"Wendy and Mike Gordon"
                            ]
let player5:[String: Any] = ["name":"Matt Gill",
                             "height":40.0,
                             "experience":false,
                             "guardian":"Charles and Sylvia Gill"
                            ]
let player6:[String: Any] = ["name":"Kimmy Stein",
                             "height":41.0,
                             "experience":false,
                             "guardian":"Bill and Hillary Stein"
                            ]
let player7:[String: Any] = ["name":"Sammy Adams",
                             "height":45.0,
                             "experience":false,
                             "guardian":"Jeff Adams"
                            ]
let player8:[String: Any] = ["name":"Karl Saygan",
                             "height":42.0,
                             "experience":true,
                             "guardian":"Heather Bledsoe"
                            ]
let player9:[String: Any] = ["name":"Suzane Greenberg",
                             "height":44.0,
                             "experience":true,
                             "guardian":"Henrietta Dumas"
                            ]
let player10:[String: Any] = ["name":"Sal Dali",
                              "height":41.0,
                              "experience":false,
                              "guardian":"Gala Dali"
                             ]
let player11:[String: Any] = ["name":"Joe Kavalier",
                              "height":39.0,
                              "experience":false,
                              "guardian":"Sam and Elaine Kavalier"
                             ]
let player12:[String: Any] = ["name":"Ben Finkelstein",
                              "height":44.0,
                              "experience":false,
                              "guardian":"Aaron and Jill Finkelstein"
                             ]
let player13:[String: Any] = ["name":"Diego Soto",
                              "height":41.0,
                              "experience":true,
                              "guardian":"Robin and Sarika Soto"
                             ]
let player14:[String: Any] = ["name":"Chloe Alaska",
                              "height":47.0,
                              "experience":false,
                              "guardian":"David and Jamie Alaska"
                             ]
let player15:[String: Any] = ["name":"Arnold Willis",
                              "height":43.0,
                              "experience":false,
                              "guardian":"Claire Willis"
                             ]
let player16:[String: Any] = ["name":"Phillip Helm",
                              "height":44.0,
                              "experience":true,
                              "guardian":"Thomas Helm and Eva Jones"
                             ]
let player17:[String: Any] = ["name":"Les Clay",
                              "height":42.0,
                              "experience":true,
                              "guardian":"Wynonna Brown"
                             ]
let player18:[String: Any] = ["name":"Herschel Krustofski",
                              "height":45.0,
                              "experience":true,
                              "guardian":"Hyman and Rachel Krustofski"
                             ]

// Use a collection constant to hold all the players’ data
let players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

// Function to print to console player details in a collection
func displayDetails(of players: [[String: Any]]) {
    for player in players {
        print("") // To add a new line
        for (attribute, attributeValue) in player {
            print("\(attribute): \(attributeValue)")
        }
    }
}

// Test the displayDetails function by displaying information of all players in the league
print("Listing below the details of all players in the league")
print("------------------------------------------------------")
displayDetails(of: players)
print("")

/*
 * Part 2
 * a) Put all experienced players in an array
 * b) Put all inexperienced players in another array
 * c) To have similar average height across teams,
 *       1) Sort experienced players array in ascending order of their heights
 *       2) Sort inexperienced players array in descending order of their heights
 * d) Distribute across the teams, players from the sorted experienced and
 *    inexperienced players list in such a way that it satisfies the following conditions
 *    1. Ratio of experienced to inexperienced players across teams should be same
 *    2. Average Height difference between teams shouldn't exceed more than 1.5 inches
 */

var experiencedLeaguePlayers = [[String: Any]]()
var inExperiencedLeaguePlayers = [[String: Any]]()

// To prevent a crash while force downcasting player["experience"] from 'Any' to 'Bool'
func isPlayerExperienceBoolConvertible(in collection: [[String: Any]]) -> Bool {
    if collection.isEmpty { return false }
    for player in collection {
        if player["experience"] is Bool {
            continue
        } else {
            return false
        }
    }
    return true
}

// Put all experienced and inexperienced players in respective arrays
if isPlayerExperienceBoolConvertible(in: players) {
   for player in players {
        if (player["experience"] as! Bool == true) {
            experiencedLeaguePlayers.append(player)
        } else {
            inExperiencedLeaguePlayers.append(player)
        }
   }
}

/* To achieve similar average player height across teams,
 * the strategy employed here is
 * a) Sort experienced players in increasing order of height
 * b) Sort inexperienced players in decreasing order of height
 * c) Pick players from these sorted lists while adding to team so that
 *    average height of players in a team balances out across teams.
 */

// To prevent a crash while force downcasting player["height"] from 'Any' to 'Double'
func isPlayerHeightDoubleConvertible(in collection: [[String: Any]]) -> Bool {
    if collection.isEmpty { return false }
    for player in collection {
        if player["height"] is Double {
            continue
        } else {
            return false
        }
    }
    return true
}

var leagueTeams = [[[String: Any]]]()
let totalTeams = 3

// Adding empty teams to league before distributing players across them
for _ in 1...totalTeams {
    leagueTeams.append([[String:Any]]())
}

if isPlayerHeightDoubleConvertible(in: experiencedLeaguePlayers) && isPlayerHeightDoubleConvertible(in: inExperiencedLeaguePlayers) {
    // Sort experiencedLeaguePlayers in ascending order based on their heights and store the sorted array to a new collection
    let incHeightOrderExperiencedPlayers = experiencedLeaguePlayers.sorted{ ($0["height"] as! Double) < ($1["height"] as! Double) }

    // Sort inExperiencedLeaguePlayers in decending order based on their height and store the sorted array to a new collection
    let decHeightOrderInExperiencedPlayers = inExperiencedLeaguePlayers.sorted{ ($0["height"] as! Double) > ($1["height"] as! Double) }

    let totalExperiencedPlayers = incHeightOrderExperiencedPlayers.count
    let totalInExperiencedPlayers = decHeightOrderInExperiencedPlayers.count
    
    // Distribute the players in a balanced manner across the teams present in the leagueTeams Collection
    var j: Int
    for i in 0..<totalTeams {
        j = i
        // Distributing experienced players equally across teams
        for _ in 1...(totalExperiencedPlayers / totalTeams) {
            leagueTeams[i].append(incHeightOrderExperiencedPlayers[j])
           j += totalTeams
        }
        j = i
        // Distributing inexperienced players equally across teams
        for _ in 1...(totalInExperiencedPlayers / totalTeams) {
            leagueTeams[i].append(decHeightOrderInExperiencedPlayers[j])
           j += totalTeams
        }
    }
}

// Store each team’s players in its own collection for use in Part 3.
let teamDragons = leagueTeams[0]
let teamSharks = leagueTeams[1]
let teamRaptors = leagueTeams[2]

print("Team Dragons players are")
print("------------------------------")
displayDetails(of: teamDragons)
print("")

print("Team Sharks players are")
print("------------------------------")
displayDetails(of: teamSharks)
print("")

print("Team Raptors players are")
print("------------------------------")
displayDetails(of: teamRaptors)
print("")

/*
 * Part 3
 * Send a personalized letter to each of the players' guardians specifying
 * a) The player’s name
 * b) Guardian names
 * c) Team name
 * d) Date/time of their first team practice
 *    Dragons - March 17, 1pm
 *    Sharks - March 17, 3pm
 *    Raptors - March 18, 1pm
 */
let dragonsPracticeTime = "March 17, 1pm"
let sharksPraciceTime = "March 17, 3pm"
let raptorsPracticeTime = "March 18, 1pm"

// Function that compose and return personalized letters for each player's guardians belonging to a team
func composePersonalizedLettersToGuardians(ofTeam team: [[String: Any]], havingName teamName: String, aboutPracticeDateAndTime dateTime: String) -> [String] {
    var playerGuardian = ""
    var playerName = ""
    var letterBody = ""
    var letters = [String]()
    
    for player in team {
        if player["guardian"] is String && player["name"] is String {
            playerGuardian = player["guardian"] as! String
            playerName = player["name"] as! String
            letterBody = "To: \(playerGuardian), Your child \(playerName) from Team \(teamName) will attend their first team practice on \(dateTime)"
            letters.append(letterBody)
        }
    }
    return letters
}

// Function to send the letter to guardians of all players of all Teams
func sendToGuardians(_ letters: [String]) {
    for letter in letters {
        print(letter)
    }
}

// Prepare and store letters to be sent out to each Team's player's guardians
let teamDragonsLetters = composePersonalizedLettersToGuardians(ofTeam: teamDragons, havingName: "Dragons", aboutPracticeDateAndTime: dragonsPracticeTime)
let teamSharksLetters = composePersonalizedLettersToGuardians(ofTeam: teamSharks, havingName: "Sharks", aboutPracticeDateAndTime: sharksPraciceTime)
let teamRaptorsLetters = composePersonalizedLettersToGuardians(ofTeam: teamRaptors, havingName: "Raptors", aboutPracticeDateAndTime: raptorsPracticeTime)

// Compile all team letters in a single collection
let letters = teamDragonsLetters + teamSharksLetters + teamRaptorsLetters

// Send personalized letter to guardians of every players of all teams
print("Sending personalized letters to guardians of all players")
sendToGuardians(letters)

print("") // To put a new line

// Function to get average height of a team
func getAvgHeightOfPlayers(in team:[[String: Any]]) -> Double {
    if team.isEmpty { return 0.0 }
    var sumOfAllPlayersHeight = 0.0
    let totalPlayers = Double(team.count)
    if isPlayerHeightDoubleConvertible(in: team) {
        for player in team {
            sumOfAllPlayersHeight += player["height"] as! Double
        }
    } else {
        return 0.0
    }
    return sumOfAllPlayersHeight / totalPlayers
}

// Get and print the average height of players of each team
print("----------------------------------------------------------------------------------------")
print("Average height of players of Team Dragons is \(getAvgHeightOfPlayers(in: teamDragons)) inches")
print("Average height of players of Team Sharks is \(getAvgHeightOfPlayers(in: teamSharks)) inches")
print("Average height of players of Team Raptors is \(getAvgHeightOfPlayers(in: teamRaptors)) inches")
