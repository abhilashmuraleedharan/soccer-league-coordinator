/*******************************************
 * Soccer League Coordinator App
 * ( Developing, as I go about learning more about Swift Language)
 *******************************************/

/*
 * This application must help a person who is acting as a soccer league coordinator of a school to
 * create a soccer league, create league teams and then sort the league players
 * into well balanced teams so that
 * a) Every team have an equal balance of experienced and inexperienced soccer players and
 * b) Every team's average players' heights should be not more than 1.5 inches of each other's
 *
 */

// Player Class to model a league player
class Player {
    let name: String
    let height: Double
    let experience: Bool
    let guardian: String
    let guardianEmailId: String
    
    init(name: String, height: Double, experience: Bool, guardian: String, guardianEmailId: String) {
        self.name = name
        self.height = height
        self.experience = experience
        self.guardian = guardian
        self.guardianEmailId = guardianEmailId
    }
    
    /// Instance method to view all player information
    func information() {
        print("Name \(name)")
        print("Height \(height) inches")
        if (experience) {
            print("Pro Player")
        } else {
            print("Amateur Player")
        }
        print("Guardian(s) \(guardian)")
        print("Guardian Email : \(guardianEmailId)")
    }
}

// Email struct to model email to be sent to players' guardians
struct Email {
    let to: String
    let from: String = "soccer.coordinator@treehouse.org"
    var body: String
    
    /// Instance to print email
    func preview() {
        print("From: \(from)")
        print("To: \(to)")
        print(body)
    }
}

// Team Class to model a league team
class Team {
    let name: String
    var players: [Player]
    var emails: [Email]
    var practiceDateTime: String
    // Add code later to include attributes like
    // Team Logo , Team Color and so on
    
    init(name: String) {
        self.name = name
        self.players = []
        self.emails = []
        self.practiceDateTime = ""
    }
    
    /// Instance method to add players
    func add(player: Player) {
        players.append(player)
    }
    
    /// Instance method to return the average height of the players
    func averageHeightOfPlayers() -> Double {
        var sumOfAllPlayersHeights: Double = 0.0
        for player in players {
            sumOfAllPlayersHeights += player.height
        }
        return sumOfAllPlayersHeights / Double(players.count)
    }
    
    /// Instance method to display the details of all players
    func information() {
        print("\(name) players are :")
        print("")
        for player in players {
            player.information()
            print("")
        }
    }
    
    /// Instance method to assign the practice date and time
    func set(practiceDateTime dateTime: String) {
        practiceDateTime = dateTime
    }
    
    /// Instance method to generate players' guardian emails
    func prepGuardianEmails() {
        var email: Email
        var content: String
        for player in players {
            content = "Your child \(player.name) from Team \(name) will attend their first team practice on \(practiceDateTime)"
            email = Email(to: player.guardianEmailId, body: content)
            emails.append(email)
        }
    }
    
    /// Instance method to display all emails to be sent to players' guardians
    func previewEmails() {
        print("List of Team \(name) emails :")
        print("")
        for email in emails {
            email.preview()
        }
    }
}

// League Class to model the Soccer League
class League {
    let name: String
    let teamsCount: Int
    let teamStrength: Int
    var players: [Player]
    var teamNames: [String]
    var teams: [Team]
    
    init(name: String, withTotalTeams teamsCount: Int, havingStrength strength: Int) {
        self.name = name
        self.teamsCount = teamsCount
        self.teamStrength = strength
        self.teams = []
        self.teamNames = []
        self.players = []
    }
    
    /// Instance method to display league information
    func information() {
        print("\(name) League Information")
        if teams.count > 0 {
            print("Total Number of teams participating: \(teamsCount)")
            print("Each team comprises of \(teamStrength) players")
            print("Listing below details of each team :")
            print("")
            for team in teams {
                team.information()
            }
        } else {
            print("No players added to the league yet!")
        }
    }
    
    /// Instance method to add players to the league
    func add(player: Player) {
        players.append(player)
    }
    
    /// Instance method to create teams
    func create(teams: [String]) {
        
        if (teams.count != teamsCount) {
            print("Teams Count Mismatch. Pass the names of all teams")
            return
        }
        
        var experiencedPlayers = [Player]()
        var inExperiencedPlayers = [Player]()
        
        // Put all experienced and inexperienced players in separate lists
        for player in players {
            if (player.experience == true) {
                experiencedPlayers.append(player)
            } else {
                inExperiencedPlayers.append(player)
            }
        }
        
        /* To achieve similar average player height across teams,
         * the strategy employed here is
         * a) Sort experienced players in increasing order of height
         * b) Sort inexperienced players in decreasing order of height
         * c) Pick players from these sorted lists while adding to team so that
         *    average height of players in a team balances out across teams.
         */
        
        // Sort experiencedLeaguePlayers in ascending order based on their heights and store the sorted array to a new collection
        let incHeightSortedExperiencedPlayers = experiencedPlayers.sorted{ ($0.height) < ($1.height) }
        
        // Sort inExperiencedLeaguePlayers in decending order based on their height and store the sorted array to a new collection
        let decHeightSortedInExperiencedPlayers = inExperiencedPlayers.sorted{ ($0.height) > ($1.height) }
        
        // Distribute the players in a balanced manner across the teams present in the leagueTeams Collection
        var j: Int
        var team: Team
        for i in 0..<teamsCount {
            team = Team(name: teams[i])
            j = i
            // Distributing experienced players equally across teams
            for _ in 1...(incHeightSortedExperiencedPlayers.count / teamsCount) {
                team.add(player: incHeightSortedExperiencedPlayers[j])
                j += teamsCount
            }
            j = i
            // Distributing inexperienced players equally across teams
            for _ in 1...(decHeightSortedInExperiencedPlayers.count / teamsCount) {
                team.add(player: decHeightSortedInExperiencedPlayers[j])
                j += teamsCount
            }
            self.teams.append(team)
        }
    }
    
    /// Instance method to send emails to players' guardians
    func informGuardians() {
        for team in teams {
            team.prepGuardianEmails()
            team.previewEmails()
        }
    }
    
    /// Instance method to assign practice date and time for each team
    func assignToTeams(practiceDateTime dateTime: [String] ) {
        if dateTime.count != teamsCount {
            print("Missing Information. Please pass practice timings for all teams")
            return
        }
        var i: Int = 0
        for team in teams {
            team.set(practiceDateTime: dateTime[i])
            i += 1
        }
    }
    
}

// As a soccer league coordinator use the above objects to create your teams
let league = League(name: "FIFA", withTotalTeams: 3, havingStrength: 6)
let player1 = Player(name: "Joe Smith", height: 42.0, experience: true, guardian: "Jim and Jan Smith", guardianEmailId: "jimsmith@gmail.com")
player1.information()
league.add(player: player1)

