import Foundation


extension Array where Element == Ladder.Component {
    
    /// 배열에 원소를 무작위로 삽입합니다.
    mutating func insertRungsRandomly() {
        for index in self.indices {
            if Bool.random() {
                self[index] = Ladder.Component.rung
            }
        }
    }
    
}


struct Ladder {
    enum Component: String {
        case rung = "-"
        case empty = " "
    }
    
    var info: [[Component]]
    
    init(numberOfParticipants: Int, height: Int) {
        let row = [Component](repeating: Component.empty, count: numberOfParticipants - 1)
        info = [[Component]](repeating: row, count: height)
        for index in info.indices {
            info[index].insertRungsRandomly()
        }
    }
    
    private func getString(row: [Component]) -> String {
        var printableRow = ""
        let verticalLine = "|"
        printableRow += verticalLine
        for component in row {
            printableRow += component.rawValue
            printableRow += verticalLine
        }
        return printableRow
    }
    
    /// 사다리를 출력가능한 문자열로 변환하고 반환합니다.
    func stringizing() -> String {
        /// 열에 세로줄을 추가합니다.
        var printable = ""
        for row in info {
            printable += "\(getString(row: row))\n"
        }
        return printable
    }
    
}


func getInput() -> (numberOfParticipants: Int, height: Int)? {
    print("참여할 사람은 몇 명 인가요?")
    guard let numberOfParticipants = Int(readLine()!) else {
        print("오류: 숫자 아님")
        return nil
    }
    print("최대 사다리 높이는 몇 개인가요?")
    guard let height = Int(readLine()!) else {
        print("오류: 숫자 아님")
        return nil
    }
    return (numberOfParticipants, height)
}

func getLadder(numberOfParticipants: Int, height: Int) -> Ladder {
    return Ladder(numberOfParticipants: numberOfParticipants, height: height)
}

func run() {
    guard let input = getInput() else {
        return
    }
    let ladder = getLadder(numberOfParticipants: input.numberOfParticipants, height: input.height)
    print(ladder.stringizing())
}

run()
