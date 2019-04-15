import Foundation

extension Array where Element == Ladder.Component {
    
    /// 사다리 열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
    func rungsRandomlyInserted() -> [Ladder.Component] {
        var wasPlacedJustBefore = false
        var rowWithRungs = self
        for index in self.indices {
            if !wasPlacedJustBefore && Bool.random() {
                rowWithRungs[index] = Ladder.Component.rung
                wasPlacedJustBefore = true
            } else {
                wasPlacedJustBefore = false
            }
        }
        return rowWithRungs
    }
    
}

struct Ladder {
    
    enum Component: String {
        case rung = "-"
        case empty = " "
    }
    
    let info: [[Component]]
    
    init(numberOfPlayers: Int, height: Int) {
        let row = [Component](repeating: Component.empty, count: numberOfPlayers - 1)
        let emptyLadder: [[Component]] = [[Component]](repeating: row, count: height)
        var ladder = emptyLadder.map { $0.rungsRandomlyInserted() }
        // 사다리 타기 로직 구현에 용이하도록 추가하는 항목입니다.
        for row in ladder.indices {
            ladder[row].insert(Component.empty, at: 0)
            ladder[row].append(Component.empty)
        }
        info = ladder
    }
    
}
