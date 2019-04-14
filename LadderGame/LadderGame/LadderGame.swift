import Foundation

extension Array where Element == LadderComponent {
    
    /// 사다리 열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
    func rungsRandomlyInserted() -> [LadderComponent] {
        var wasPlacedJustBefore = false
        var rowWithRungs = self
        for index in self.indices {
            if !wasPlacedJustBefore && Bool.random() {
                rowWithRungs[index] = LadderComponent.rung
                wasPlacedJustBefore = true
            } else {
                wasPlacedJustBefore = false
            }
        }
        return rowWithRungs
    }
    
}

enum LadderComponent: String {
    case rung = "-"
    case empty = " "
}

struct LadderGame {
    
    //MARK: 속성
    let ladder: Ladder
    let players: [Player]
    
    //MARK: 초기화 함수
    init(players: [Player], height: Int) {
        self.players = players
        ladder = Ladder(numberOfPlayers: players.count, height: height)
    }
    
    //MARK: 비공개 메소드
    private func stepDownLadder(playerIndex: Int) -> Int {
        var currentIndex = playerIndex
        for row in ladder.info {
            switch LadderComponent.rung {
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
    func results() -> [Player] {
        var result = players
        for playerIndex in players.indices {
            let resultIndex = stepDownLadder(playerIndex: playerIndex)
            result[resultIndex] = players[playerIndex]
        }
        return result
    }
    
}
