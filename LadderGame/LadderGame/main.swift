import Foundation


enum LadderComponent: String {
    case rung = "-"
    case empty = " "
}


func insertRungsRandomlyWithoutSuccession(row: [LadderComponent]) -> [LadderComponent] {
    var rungPlacedJustBefore = false
    var rowWithRung = row
    for index in row.indices {
        if !rungPlacedJustBefore && Bool.random() {
            rowWithRung[index] = LadderComponent.rung
            rungPlacedJustBefore = true
        } else {
            rungPlacedJustBefore = false
        }
    }
    return rowWithRung
}



func createLadder(numberOfParticipants: Int, height: Int) -> [[LadderComponent]] {
    let row = [LadderComponent](repeating: LadderComponent.empty, count: numberOfParticipants - 1)
    let ladder = [[LadderComponent]](repeating: row, count: height)
    var ladderWithRung: [[LadderComponent]] = []
    for index in ladder.indices {
        ladderWithRung.append(insertRungsRandomlyWithoutSuccession(row: ladder[index]))
        ladderWithRung[index].insert(LadderComponent.empty, at: 0)
        ladderWithRung[index].append(LadderComponent.empty)
    }
    return ladderWithRung
}

/// 한 열을 사다리를 표현하는 문자열로 변환합니다.
func stringize(row: [LadderComponent]) -> String {
    let stringizedInfo = row.map { $0.rawValue }
    return stringizedInfo.joined(separator: "|")
}

/// 사다리를 사다리를 표현하는 문자열로 변환합니다.
func stringize(ladder: [[LadderComponent]]) -> String {
    var stringizedLadder = ""
    for row in ladder {
        stringizedLadder.append("\(stringize(row: row))\n")
    }
    return stringizedLadder
}



func getNumberOfParticipants() -> Int? {
    print("참여할 사람은 몇 명 인가요?")
    guard let numberOfParticipants = Int(readLine()!), numberOfParticipants > 1 else {
        print("오류: 잘못된 형식")
        return nil
    }
    return numberOfParticipants
}

func getLadderHeight() -> Int? {
    print("최대 사다리 높이는 몇 개인가요?")
    guard let height = Int(readLine()!), height > 0 else {
        print("오류: 잘못된 형식")
        return nil
    }
    return height
}


