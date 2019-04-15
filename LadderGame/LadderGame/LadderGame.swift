import Foundation

struct LadderGame {
    
    //MARK: 비공개 속성
    private let ladder: Ladder
    private let players: [Player]
    
    //MARK: 초기화 함수
    init(players: [Player], height: Int) throws {
        self.players = players
        ladder = try Ladder(numberOfPlayers: players.count, height: height)
    }
    
    //MARK: 비공개 메소드
    private func stepDownLadder(playerIndex: Int, ladderInfo: [[Ladder.Component]]? = nil) -> Int {
        let ladderInfoForStepDown = ladderInfo ?? self.ladder.info
        var currentIndex = playerIndex
        for row in ladderInfoForStepDown {
            switch Ladder.Component.rung {
            case row[currentIndex]:
                currentIndex -= 1
            case row[currentIndex + 1]:
                currentIndex += 1
            default:
                break
            }
        }
        return currentIndex
    }
    
    //MARK: 메소드
    func info() -> [[Ladder.Component]] {
        return ladder.info
    }
    
    func gamePlayers() -> [Player] {
        return players
    }
    
    func results(ladderInfo: [[Ladder.Component]]? = nil, players: [Player]? = nil) -> [Player] {
        let ladderForResult = ladderInfo ?? self.ladder.info
        var playersForResult = players ?? self.players
        
        var result = playersForResult
        for playerIndex in playersForResult.indices {
            let resultIndex = stepDownLadder(playerIndex: playerIndex, ladderInfo: ladderForResult)
            result[resultIndex] = playersForResult[playerIndex]
        }
        return result
    }
    
}
