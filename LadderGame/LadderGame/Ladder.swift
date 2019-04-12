struct Ladder {
    enum Component: String {
        case rung = "-"
        case empty = " "
    }
    
    //MARK: 프로퍼티
    let participants: [String]
    let numberOfParticipants: Int
    private let height: Int
    let info: [[Component]]
    
    
    init(participants: [String], height: Int) {
        self.participants = participants
        numberOfParticipants = participants.count
        self.height = height
        // 사다리 만들기 시작
        let row = [Component](repeating: Component.empty, count: numberOfParticipants - 1)
        let emptyLadder = [[Component]](repeating: row, count: height)
        var ladder: [[Component]] = []
        for index in emptyLadder.indices {
            ladder.append(emptyLadder[index].rungsRandomlyInserted())
            // 사다리 타기 로직 구현에 용이하도록 추가하는 항목입니다.
            ladder[index].insert(Component.empty, at: 0)
            ladder[index].append(Component.empty)
        }
        self.info = ladder
    }
    
}
