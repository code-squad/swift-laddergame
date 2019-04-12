import Foundation

extension Array where Element == LadderComponent {
    
    /// 사다리 배열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
    func rungsRandomlyInserted() -> [LadderComponent]{
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


func createLadder(numberOfParticipants: Int, height: Int) -> [[LadderComponent]] {
    let row = [LadderComponent](repeating: LadderComponent.empty, count: numberOfParticipants - 1)
    let emptyLadder = [[LadderComponent]](repeating: row, count: height)
    var ladder: [[LadderComponent]] = []
    for index in emptyLadder.indices {
        ladder.append(emptyLadder[index].rungsRandomlyInserted())
        // 사다리 타기 로직 구현에 용이하도록 추가하는 항목입니다.
        ladder[index].insert(LadderComponent.empty, at: 0)
        ladder[index].append(LadderComponent.empty)
    }
    return ladder
}

/// 한 열을 사다리를 표현하는 문자열로 변환합니다.
func stringize(row: [LadderComponent]) -> String {
    let stringizedInfo = row.map { $0.rawValue }
    return stringizedInfo.joined(separator: "|")
}

/// 사다리를 사다리를 표현하는 문자열로 변환합니다.
func print(ladder: [[LadderComponent]]) {
    var stringizedLadder = ""
    for row in ladder {
        stringizedLadder.append("\(stringize(row: row))\n")
    }
    print(stringizedLadder)
}


enum InputError: Error {
    case invalidInput
    case invalidNumberOfParticipants
    case invalidLadderHeight
}

func readLadderInfo() throws -> (numberOfParticipants: Int, height: Int) {
    let numberOfParticipants = try askUserAndReadNumber(question: "참여할 사람은 몇 명 인가요?")
    guard numberOfParticipants > 1 else {
        throw InputError.invalidNumberOfParticipants
    }
    let height = try askUserAndReadNumber(question: "사다리 높이는 몇 개인가요?")
    guard height > 0 else {
        throw InputError.invalidLadderHeight
    }
    return (numberOfParticipants, height)
}


func askUserAndReadNumber(question: String) throws -> Int {
    print(question)
    guard let numberEnterd = Int(readLine()!) else {
        throw InputError.invalidInput
    }
    return numberEnterd
}


func runLadderGame() throws {
    let ladderInfo = try readLadderInfo()
    let ladder = createLadder(numberOfParticipants: ladderInfo.numberOfParticipants, height: ladderInfo.height)
    print(ladder: ladder)
}


do {
    try runLadderGame()
} catch InputError.invalidInput {
    print("오류: 유효하지 않은 입력")
} catch InputError.invalidNumberOfParticipants {
    print("오류: 유효하지 않은 참여자 수")
} catch InputError.invalidLadderHeight {
    print("오류: 유효하지 않은 사다리 높이")
} catch {
    print("예상치 못한 오류: \(error)")
}

