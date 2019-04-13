import Foundation

struct Ladder {
    
    //MARK: 유형
    enum Component: String {
        case rung = "-"
        case empty = " "
    }
    
    //MARK: 속성
    let info: [[Component]]
    
    //MARK: 이니셜라이저
    init(numberOfPlayers: Int, height: Int) {
        // 사다리 만들기 시작
        let row = [Component](repeating: Component.empty, count: numberOfPlayers - 1)
        let emptyLadder = [[Component]](repeating: row, count: height)
        var info: [[Component]] = []
        for index in emptyLadder.indices {
            info.append(emptyLadder[index].rungsRandomlyInserted())
            // 사다리 타기 로직 구현에 용이하도록 추가하는 항목입니다.
            info[index].insert(Component.empty, at: 0)
            info[index].append(Component.empty)
        }
        self.info = info
    }
    
}
