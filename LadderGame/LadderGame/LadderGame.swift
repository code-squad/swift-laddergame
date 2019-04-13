import Foundation

extension Array where Element == LadderComponent {
    /// 사다리 배열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
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
    
    let ladder: [[LadderComponent]]
    let players: [Player]
    static let maximumNameLength = 5
    
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
    
    
    
}
