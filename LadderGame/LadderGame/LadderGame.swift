import Foundation

struct LadderGame {
    
    let ladder: Ladder
    let players: [Player]
    static let maximumNameLength = 5
    
    init(players: [Player], height: Int) {
        self.players = players
        ladder = Ladder(numberOfPlayers: players.count, height: height)
    }
    
    
    
    
}
