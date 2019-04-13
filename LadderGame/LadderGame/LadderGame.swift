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
    let ladder: [[LadderComponent]]
    let players: [Player]
    static let maximumNameLength = 5
    
    //MARK: 초기화 함수
    init(players: [Player], height: Int) {
        self.players = players
        
        var ladder: [[LadderComponent]] = []
        let row = [LadderComponent](repeating: LadderComponent.empty, count: players.count - 1)
        let emptyLadder: [[LadderComponent]] = [[LadderComponent]](repeating: row, count: height)
        
        for row in emptyLadder.indices {
            ladder.append(emptyLadder[row].rungsRandomlyInserted())
            // 사다리 타기 로직 구현에 용이하도록 추가하는 항목입니다.
            ladder[row].insert(LadderComponent.empty, at: 0)
            ladder[row].append(LadderComponent.empty)
        }
        self.ladder = ladder
    }
    
    //MARK: 비공개 메소드
    private func stepDownLadder(playerIndex: Int) -> Int {
        var currentIndex = playerIndex
        for row in ladder {
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
    func result() -> [Player] {
        var result = players
        for playerIndex in players.indices {
            let resultIndex = stepDownLadder(playerIndex: playerIndex)
            result[resultIndex] = players[playerIndex]
        }
        return result
    }
    
}
