extension Array where Element == Ladder.Component {
    /// 사다리 배열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
    func rungsRandomlyInserted() -> [Ladder.Component]{
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
    func stringized() -> String {
        let stringizedInfo = self.map { String(repeating: $0.rawValue, count: 5) }
        return stringizedInfo.joined(separator: "|")
    }
}







struct Ladder {
    enum Component: String {
        case rung = "-"
        case empty = " "
    }
    
    //MARK: 프로퍼티
    let participants: [String]
    let numberOfParticipants: Int
    let height: Int
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
    
    
    func stringized() -> String {
        var stringizedLadder = ""
        stringizedLadder.append(String(repeating: " ", count: 3))
        
        
        for row in info {
            stringizedLadder.append("\n\(row.stringized())")
        }
        return stringizedLadder
    }
    
    
    private func changedToFiveLetters() -> [String] {
        var alignedNames: [String] = []
        let space = " "
        for index in 0..<numberOfParticipants {
            let numberOfSpacesToAdd = 5 - alignedNames[index].count
            let spacesAtBeginning = String(repeating: space, count: numberOfSpacesToAdd / 2)
            let spacesAtEnd = String(repeating: space, count:  numberOfSpacesToAdd - spacesAtBeginning.count)
            alignedNames.append(spacesAtBeginning + alignedNames[index] + spacesAtEnd)
        }
        return alignedNames
    }
    

    
    
}
