import Foundation

struct LadderGame {
    
    //MARK: 속성
    let ladder: Ladder
    let players: [Player]
    
    //MARK: 초기화 함수
    init(players: [Player], height: Int) throws {
        self.players = players
        ladder = try Ladder(numberOfPlayers: players.count, height: height)
    }
    
    //MARK: 비공개 메소드
    private func stepDownLadder(playerIndex: Int) -> Int {
        var currentIndex = playerIndex
        for row in ladder.info {
            switch Ladder.Component.rung {
            case row[currentIndex]:
                currentIndex -= 1
            case row[currentIndex + 1]:
                currentIndex += 1
            default:
                continue
            }
        }
        return currentIndex
    }
    
    //MARK: 메소드
    func results(ladderInfo: [[Ladder.Component]]? = nil, players: [Player]? = nil) -> [Player] {
        let ladderForResult = ladderInfo ?? self.ladder.info
        let playersForResult = players ?? self.players
        
        var result = playersForResult
        for playerIndex in ladderForResult.indices {
            let resultIndex = stepDownLadder(playerIndex: playerIndex)
            result[resultIndex] = playersForResult[playerIndex]
        }
        return result
    }
    
}
