/* The objective of this project is to divide 18 children who have signed up for the league into three even teams
 * 1. Dragons
 * 2. Sharks
 * 3. Raptors
 */

/*
 * Part 1
 * a) Store the information of all players
 * b) Display all the players' information
 */
// Use an array of dictionary [String: Any] items to hold each player's information
// Declare and initialize an array of player type [[String:Any]] items to store all players
var leaguePlayersInfo = [[String : Any]]() // Initialize using initializer

leaguePlayersInfo = [
                     ["name":"Joe Smith",
                      "height":42,
                      "experience":true,
                      "guardian":"Jim and Jan Smith"
                     ],
                     ["name":"Jill Tanner",
                      "height":36,
                      "experience":true,
                      "guardian":"Clara Tanner"
                     ],
                     ["name":"Bill Bon",
                      "height":43,
                      "experience":true,
                      "guardian":"Sara and Jenny Bon"
                     ],
                     ["name":"Eva Gordon",
                      "height":45,
                      "experience":false,
                      "guardian":"Wendy and Mike Gordon"
                     ],
                     ["name":"Matt Gill",
                      "height":40,
                      "experience":false,
                      "guardian":"Charles and Sylvia Gill"
                     ],
                     ["name":"Kimmy Stein",
                      "height":41,
                      "experience":false,
                      "guardian":"Bill and Hillary Stein"
                     ],
                     ["name":"Sammy Adams",
                      "height":45,
                      "experience":false,
                      "guardian":"Jeff Adams"
                     ],
                     ["name":"Karl Saygan",
                      "height":42,
                      "experience":true,
                      "guardian":"Heather Bledsoe"
                     ],
                     ["name":"Suzane Greenberg",
                      "height":44,
                      "experience":true,
                      "guardian":"Henrietta Dumas"
                     ],
                     ["name":"Sal Dali",
                      "height":41,
                      "experience":false,
                      "guardian":"Gala Dali"
                     ],
                     ["name":"Joe Kavalier",
                      "height":39,
                      "experience":false,
                      "guardian":"Sam and Elaine Kavalier"
                     ],
                     ["name":"Ben Finkelstein",
                      "height":44,
                      "experience":false,
                      "guardian":"Aaron and Jill Finkelstein"
                     ],
                     ["name":"Diego Soto",
                      "height":41,
                      "experience":true,
                      "guardian":"Robin and Sarika Soto"
                     ],
                     ["name":"Chloe Alaska",
                      "height":47,
                      "experience":false,
                      "guardian":"David and Jamie Alaska"
                     ],
                     ["name":"Arnold Willis",
                      "height":43,
                      "experience":false,
                      "guardian":"Claire Willis"
                     ],
                     ["name":"Phillip Helm",
                      "height":44,
                      "experience":true,
                      "guardian":"Thomas Helm and Eva Jones"
                     ],
                     ["name":"Les Clay",
                      "height":42,
                      "experience":true,
                      "guardian":"Wynonna Brown"
                     ],
                     ["name":"Herschel Krustofski",
                      "height":45,
                      "experience":true,
                      "guardian":"Hyman and Rachel Krustofski"
                     ]
                    ]

// Print to console details of all players in the league to ensure the collection is having valid data
var i = 1
for player in leaguePlayersInfo {
    print("Player \(i) Details")
    print("-------------------------------------")
    for (playerDetail, playerDetailValue) in player {
        print("\(playerDetail): \(playerDetailValue)")
    }
    print("")
    i += 1
}
print("Total players in the league = \(leaguePlayersInfo.count)")






