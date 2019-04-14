import Foundation

struct Ladder {
    
    let info: [[LadderComponent]]
    
    init(numberOfPlayers: Int, height: Int) {
        let row = [LadderComponent](repeating: LadderComponent.empty, count: numberOfPlayers - 1)
        let emptyLadder: [[LadderComponent]] = [[LadderComponent]](repeating: row, count: height)
        var ladder = emptyLadder.map { $0.rungsRandomlyInserted() }
        // 사다리 타기 로직 구현에 용이하도록 추가하는 항목입니다.
        for row in ladder.indices {
            ladder[row].insert(LadderComponent.empty, at: 0)
            ladder[row].append(LadderComponent.empty)
        }
        info = ladder
    }
    
}
