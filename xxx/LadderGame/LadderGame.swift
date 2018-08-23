import Foundation

struct LadderGame {
    
    private(set) var players: [LadderPlayer]
    private var height = 0
    
    init(input: ([String], Int) ) {
        var playerNames = [LadderPlayer]()
        for name in input.0 {
            let playerName = LadderPlayer(name: name)
            playerNames.append(playerName)
        }
        self.players = playerNames
        self.height = input.1
        
    }
    
    func makeLadderElements() -> [[Bool]] {
        var ladderElements = [[Bool]](repeating: Array(repeating: false ,count: self.players.count-1), count: self.height)
        
        for i in 0..<self.height {
            for j in 0..<players.count-1 {
                ladderElements[i][j] = arc4random_uniform(2) == 0 ? true : false
            }
        }
        return ladderElements
    }
}

