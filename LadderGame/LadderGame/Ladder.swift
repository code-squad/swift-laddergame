struct Ladder {
    enum Component: String {
        case rung = "-"
        case empty = " "
    }
    
    //MARK: 프로퍼티
    let numberOfParticipants: Int
    let participants: [String]
    let height: Int
    let info: [[Component]]
    
    
    
    init(numberOfParticipants: Int, height: Int, participants: [String]) {
        self.numberOfParticipants = numberOfParticipants
        self.participants = participants
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
    
    
    
    /// 한 열을 사다리를 표현하는 문자열로 변환합니다.
    private func stringize(row: [Ladder.Component]) -> String {
        let stringizedInfo = row.map { String(repeating: $0.rawValue, count: 5) }
        return stringizedInfo.joined(separator: "|")
    }
    
    
    /// 사다리 배열에서 사다리를 표현하는 문자열을 반환합니다.
    func stringize(ladder: [[Ladder.Component]]) -> String {
        var stringizedLadder = ""
        for row in ladder {
            stringizedLadder.append("\(stringize(row: row))\n")
        }
        return stringizedLadder
    }
    
    
    func stringize(participants: [String]) -> String {
        var stringizedParticipants = ""
        for participant in participants {
            stringizedParticipants.append(String(repeating: " ", count: 2))
            stringizedParticipants.append(String(repeating: " ", count: 3 - participant.count / 2))
            stringizedParticipants.append(participant)
        }
        return stringizedParticipants
    }
    
    
    
}
