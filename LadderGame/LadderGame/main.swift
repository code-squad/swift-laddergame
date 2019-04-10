import Foundation

extension Array where Element == LadderComponent {
    
    /// 사다리 배열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
    mutating func insertRungsRandomlyWithoutSuccession() {
        var wasPlacedJustBefore = false
        for index in self.indices {
            if !wasPlacedJustBefore && Bool.random() {
                self[index] = LadderComponent.rung
                wasPlacedJustBefore = true
            } else {
                wasPlacedJustBefore = false
            }
            
            //            guard !wasPlacedJustBefore && Bool.random() else {
            //                wasPlacedJustBefore = false
            //                continue
            //            }
            //            self[index] = LadderComponent.rung
            //            wasPlacedJustBefore = true
        }
    }
    
}

enum LadderComponent: String {
    case rung = "-"
    case empty = " "
}


func createLadder(numberOfParticipants: Int, height: Int) -> [[LadderComponent]] {
    let row = [LadderComponent](repeating: LadderComponent.empty, count: numberOfParticipants - 1)
    var ladder = [[LadderComponent]](repeating: row, count: height)
    for index in ladder.indices {
        ladder[index].insertRungsRandomlyWithoutSuccession()
    }
    return ladder
}

/// 한 열을 사다리를 표현하는 문자열로 변환합니다.
func stringize(row: [LadderComponent]) -> String {
    var stringizedRow = ""
    let verticalLine = "|"
    stringizedRow += verticalLine
    for component in row {
        stringizedRow += component.rawValue
        stringizedRow += verticalLine
    }
    return stringizedRow
}

/// 사다리를 사다리를 표현하는 문자열로 변환합니다.
func stringize(ladder: [[LadderComponent]]) -> String {
    var stringizedLadder = ""
    for row in ladder {
        stringizedLadder += "\(stringize(row: row))\n"
    }
    return stringizedLadder
}


func getInputFromUser() -> (numberOfParticipants: Int, height: Int)? {
    print("참여할 사람은 몇 명 인가요?")
    guard let numberOfParticipants = Int(readLine()!), numberOfParticipants > 1 else {
        print("오류: 잘못된 형식")
        return nil
    }
    print("최대 사다리 높이는 몇 개인가요?")
    guard let height = Int(readLine()!), height > 0 else {
        print("오류: 잘못된 형식")
        return nil
    }
    return (numberOfParticipants, height)
}

/// 입력을 받고 사다리를 만든 다음 출력합니다.
func run() {
    guard let input = getInputFromUser() else {
        return
    }
    let ladder = createLadder(numberOfParticipants: input.numberOfParticipants, height: input.height)
    print(stringize(ladder: ladder))
}

run()
